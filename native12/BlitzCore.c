#include "BlitzCore.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static int load(const char*d,const char*n,void*b,size_t s){char p[4096];snprintf(p,sizeof(p),"%s/%s",d,n);FILE*f=fopen(p,"rb");if(!f)return 0;size_t got=fread(b,1,s,f);int tail=fgetc(f);fclose(f);return got==s&&tail==EOF;}
int blitz_core_init(BlitzCore*c,int w,int h,const char*assets){
    memset(c,0,sizeof(*c));if(w<320||h<200||w>4096||h>4096)return 0;
    c->width=w;c->height=h;c->depth=16;
    c->indexed=malloc((size_t)w*h);c->bgra=malloc((size_t)w*h*4);c->rgb555=calloc((size_t)w*h,2);
    uint8_t pal[1536],source[320*200],colors[157*6];
    if(!c->indexed||!c->bgra||!c->rgb555||!load(assets,"system.palette",pal,sizeof(pal))||!load(assets,"logo.indexed",c->logo,sizeof(c->logo))||!load(assets,"logo.source.indexed",source,sizeof(source))||!load(assets,"logo.source.palette",colors,sizeof(colors))){blitz_core_destroy(c);return 0;}
    for(int i=0;i<256;i++)for(int j=0;j<3;j++)c->palette[i][j]=(pal[6*i+2*j]<<8)|pal[6*i+2*j+1];
    for(int i=0;i<320*200;i++){unsigned k=source[i];if(k>=157){blitz_core_destroy(c);return 0;}unsigned r=((colors[6*k]<<8)|colors[6*k+1])>>11,g=((colors[6*k+2]<<8)|colors[6*k+3])>>11,b=((colors[6*k+4]<<8)|colors[6*k+5])>>11;c->logo555[i]=(r<<10)|(g<<5)|b;}
    /* PPC 0x1c0..0x218 initializes only the first 32 of 64 words.
       Each even index and its following odd index share an RGB555 shade.
       Remaining words are original zero-initialized globals: retain them. */
    for(int i=0;i<32;i+=2)c->grey[i]=c->grey[i+1]=(uint16_t)(0x7fff-i-(i<<5)-(i<<10));
    const double pi=3.141592653;
    for(int i=0;i<1024;i++){
        double angle=pi*(double)(float)i;
        c->path[i].x=(int16_t)(int32_t)((30000.0*cos(angle/64.0))*cos(angle/128.0));
        float twice=(float)(2.0f*(float)i);
        c->path[i].y=(int16_t)(int32_t)(4000.0*sin(((pi*(double)twice)*cos(angle/1024.0))/64.0));
    }
    for(int i=0;i<40;i++){double angle=(pi*(double)(float)i)/20.0;c->circle[i].x=(int16_t)(int32_t)(5000.0*cos(angle));c->circle[i].y=(int16_t)(int32_t)(5000.0*sin(angle));}
    blitz_core_logo(c);return 1;
}
void blitz_core_destroy(BlitzCore*c){free(c->indexed);free(c->bgra);free(c->rgb555);memset(c,0,sizeof(*c));}
static void clear(BlitzCore*c){memset(c->indexed,255,(size_t)c->width*c->height);memset(c->rgb555,0,(size_t)c->width*c->height*2);}
static void points(BlitzCore*c,uint32_t frame,int erase){
    /* The original frame counter is a signed short and wraps after 32767.
       Pixel routines 0xf14 / 0xf6c clip the full signed coordinates. */
    int t=(int16_t)frame,base=t&1023;
    for(int layer=t%3;layer<63;layer++){
        int moving=(t+layer)&1023,divisor=layer*3+10;
        uint16_t color=layer==-1?0xff00:layer==-2?0:c->grey[layer];
        for(int j=0;j<40;j++){
            int x=c->width/2+(c->circle[j].x+c->path[moving].x-c->path[base].x)/divisor;
            int y=c->height/2+(c->circle[j].y+c->path[moving].y-c->path[base].y)/divisor;
            if(x>=0&&y>=0&&x<c->width&&y<c->height){size_t k=(size_t)y*c->width+x;c->indexed[k]=erase?255:0;c->rgb555[k]=erase?0:color;}
        }
    }
}
void blitz_core_frame(BlitzCore*c,uint32_t frame){if(c->showingLogo||!c->hasFrame)clear(c);else points(c,c->lastFrame,1);points(c,frame,0);c->lastFrame=frame;c->hasFrame=1;c->showingLogo=0;}
void blitz_core_logo(BlitzCore*c){clear(c);int x=(c->width-320)/2,y=(c->height-200)/2;for(int row=0;row<200;row++){size_t dest=(size_t)(y+row)*c->width+x;memcpy(c->indexed+dest,c->logo+320*row,320);memcpy(c->rgb555+dest,c->logo555+320*row,640);}c->showingLogo=1;c->hasFrame=0;}
void blitz_core_depth(BlitzCore*c,int depth){if(depth==8||depth==16)c->depth=depth;}
void blitz_core_expand(BlitzCore*c,int fade){
    if(fade<0)fade=0;if(fade>100)fade=100;
    if(c->depth==8){uint8_t lut[256][4];for(int i=0;i<256;i++){for(int j=0;j<3;j++)lut[i][2-j]=(uint8_t)(((c->palette[i][j]>>8)*fade)/100);lut[i][3]=255;}for(size_t k=0,n=(size_t)c->width*c->height;k<n;k++)memcpy(c->bgra+4*k,lut[c->indexed[k]],4);}
    else {for(size_t k=0,n=(size_t)c->width*c->height;k<n;k++){unsigned v=c->rgb555[k];for(int j=0;j<3;j++){unsigned b=(v>>(5*j))&31;c->bgra[4*k+j]=((b<<3)|(b>>2))*fade/100;}c->bgra[4*k+3]=255;}}
}
