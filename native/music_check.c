#include "Music.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main(int argc,char **argv){int e;BlitzMusic*m=blitz_music_create(argv[1],&e);if(!m){fprintf(stderr,"error %d\n",e);return 1;}float l[1024],r[1024];double sum=0;float peak=0;FILE*f=argc>2?fopen(argv[2],"wb"):NULL;for(int j=0;j<260;j++){blitz_music_render(m,l,r,1024);for(int i=0;i<1024;i++){sum+=l[i]*l[i]+r[i]*r[i];if(fabsf(l[i])>peak)peak=fabsf(l[i]);if(f){int16_t p[2]={(int16_t)(l[i]*32767),(int16_t)(r[i]*32767)};fwrite(p,2,2,f);}}}if(f)fclose(f);blitz_music_destroy(m);printf("RMS %f peak %f\n",sqrt(sum/(260*1024*2)),peak);return peak>0?0:2;}
