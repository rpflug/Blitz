#include "Music.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>
int main(int argc,char**argv){int error=0;BlitzMusic*m=blitz_music_create(argv[1],&error);assert(m&&error==0);float firstL[4096],firstR[4096],l[4096],r[4096];blitz_music_render(m,firstL,firstR,4096);blitz_music_set_playing(m,0);blitz_music_render(m,l,r,4096);for(int i=0;i<4096;i++)assert(l[i]==0&&r[i]==0);blitz_music_set_playing(m,1);blitz_music_render(m,l,r,4096);blitz_music_restart(m);blitz_music_render(m,l,r,4096);assert(memcmp(firstL,l,sizeof(l))==0&&memcmp(firstR,r,sizeof(r))==0);blitz_music_set_fade(m,21);blitz_music_render(m,l,r,4096);blitz_music_destroy(m);puts("PASS: pause produces silence; replay reproduces first 4096 stereo samples bit for bit; final fade renders safely.");return 0;}
