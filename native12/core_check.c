#include "BlitzCore.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static void word(FILE*f,unsigned v){unsigned char b[2]={v>>8,v};assert(fwrite(b,1,2,f)==2);}
static void snapshot(BlitzCore*c,unsigned frame,int mode,const char*dir){char path[4096];snprintf(path,sizeof(path),"%s/frame-%u-%d.bin",dir,frame,mode);FILE*f=fopen(path,"wb");assert(f);if(mode==8)assert(fwrite(c->indexed,1,(size_t)c->width*c->height,f)==(size_t)c->width*c->height);else for(size_t i=0,n=(size_t)c->width*c->height;i<n;i++)word(f,c->rgb555[i]);fclose(f);}
int main(int argc,char**argv){assert(argc==3);BlitzCore c;assert(blitz_core_init(&c,1024,768,argv[1]));char path[4096];snprintf(path,sizeof(path),"%s/tables.bin",argv[2]);FILE*f=fopen(path,"wb");assert(f);for(int t=0;t<2;t++){BlitzPoint*p=t?c.circle:c.path;for(int i=0;i<(t?40:1024);i++){word(f,p[i].x);word(f,p[i].y);}}for(int i=0;i<64;i++)word(f,c.grey[i]);fclose(f);
    unsigned frames[]={0,1,2,60,256,1023,1024,32767,32768,32769,65535,65536};
    for(int mode=8;mode<=16;mode+=8){blitz_core_depth(&c,mode);blitz_core_logo(&c);for(unsigned i=0;i<sizeof(frames)/sizeof(frames[0]);i++){blitz_core_frame(&c,frames[i]);snapshot(&c,frames[i],mode,argv[2]);}blitz_core_expand(&c,0);for(size_t i=0;i<1024*768;i++)assert(c.bgra[4*i]==0&&c.bgra[4*i+1]==0&&c.bgra[4*i+2]==0);}
    /* A consecutive animation exercises erasing, overlapping points and both modes. */
    for(int mode=8;mode<=16;mode+=8){blitz_core_depth(&c,mode);blitz_core_logo(&c);for(unsigned frame=0;frame<121;frame++){blitz_core_frame(&c,frame);if(frame==120)snapshot(&c,frame,mode,argv[2]);}}
    blitz_core_destroy(&c);puts("Generated 1.2 native table words, mode snapshots and counter-wrap cases");return 0;
}
