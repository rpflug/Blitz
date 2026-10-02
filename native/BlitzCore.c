#include "BlitzCore.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int load(const char *dir,const char *name,void *data,size_t n){char p[4096];snprintf(p,sizeof(p),"%s/%s",dir,name);FILE*f=fopen(p,"rb");if(!f)return 0;size_t got=fread(data,1,n,f);int tail=fgetc(f);fclose(f);return got==n&&tail==EOF;}
int blitz_core_init(BlitzCore *c,int w,int h,const char *assets) {
    memset(c,0,sizeof(*c));if(w<320||h<200||w>4096||h>4096)return 0;
    c->width=w;c->height=h;c->indexed=malloc((size_t)w*h);c->bgra=malloc((size_t)w*h*4);
    uint8_t palette[1536];
    if(!c->indexed||!c->bgra||!load(assets,"system.palette",palette,sizeof(palette))||!load(assets,"logo.indexed",c->logo,sizeof(c->logo))){blitz_core_destroy(c);return 0;}
    for(int i=0;i<256;i++)for(int j=0;j<3;j++)c->palette[i][j]=(palette[6*i+2*j]<<8)|palette[6*i+2*j+1];
    /* Follow PPC instructions 0x2ac..0x3d0: fmuls/fsubs round to single,
       fmul/fdiv use double; fctiwz truncates toward zero. Disable contraction. */
    const double pi=3.141592654;
    for(int i=0;i<1024;i++){
        float fi=(float)i;
        float twice=(float)(2.0f*fi);
        double angle=pi*(double)twice;
        double a=cos(angle/256.0),b=cos(angle/128.0);
        c->path[i].x=(int32_t)((30000.0*b)*a);
        double wave=cos(angle/2048.0);
        c->path[i].y=(int32_t)(6500.0*sin((angle*wave)/64.0));
    }
    for(int i=0;i<40;i++){
        float twice=(float)(2.0f*(float)i);
        double angle=(pi*(double)twice)/40.0;
        c->circle[i].x=(int32_t)(5000.0*cos(angle));
        c->circle[i].y=(int32_t)(5000.0*sin(angle));
    }
    blitz_core_logo(c);return 1;
}
void blitz_core_destroy(BlitzCore*c){free(c->indexed);free(c->bgra);memset(c,0,sizeof(*c));}
static void put(BlitzCore*c,int32_t x,int32_t y,uint8_t color){
    /* Original routine 0xff8 narrows each coordinate to signed 16-bit first. */
    int16_t sx=(int16_t)x,sy=(int16_t)y;
    if(sx>=0&&sy>=0&&sx<c->width&&sy<c->height)c->indexed[(size_t)sy*c->width+sx]=color;
}
void blitz_core_frame(BlitzCore*c,uint32_t frame){
    memset(c->indexed,255,(size_t)c->width*c->height);
    int32_t t=(int32_t)frame;int base=t&1023;
    /* 0x4e4..0x594: phase-selected start; every subsequent layer is drawn. */
    for(int layer=t%3;layer<100;layer++){
        int moving=(t+layer)&1023,divisor=layer*3+10;
        for(int j=0;j<40;j++){
            int32_t x=c->width/2+(c->circle[j].x+c->path[moving].x-c->path[base].x)/divisor;
            int32_t y=c->height/2+(c->circle[j].y+c->path[moving].y-c->path[base].y)/divisor;
            put(c,x,y,0);
        }
    }
}
void blitz_core_logo(BlitzCore*c){memset(c->indexed,255,(size_t)c->width*c->height);int x=(c->width-320)/2,y=(c->height-200)/2;for(int r=0;r<200;r++)memcpy(c->indexed+(size_t)(y+r)*c->width+x,c->logo+320*r,320);}
void blitz_core_expand(BlitzCore*c,int fade){
    if(fade<0)fade=0;if(fade>100)fade=100;
    uint8_t lut[256][4];
    /* 0xc84: copied ColorTable payload bytes are scaled individually by level/100.
       Preserve this peculiar byte arithmetic, rather than scaling 16-bit colors. */
    for(int i=0;i<256;i++){
        for(int j=0;j<3;j++)lut[i][2-j]=(uint8_t)(((c->palette[i][j]>>8)*fade)/100);
        lut[i][3]=255;
    }
    for(size_t i=0,n=(size_t)c->width*c->height;i<n;i++)memcpy(c->bgra+4*i,lut[c->indexed[i]],4);
}
