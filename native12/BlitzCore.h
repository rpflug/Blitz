#ifndef BLITZ_CORE_H
#define BLITZ_CORE_H
#include <stdint.h>
#include <stddef.h>
typedef struct { int32_t x,y; } BlitzPoint;
typedef struct {
    int width,height,depth,hasFrame,showingLogo;
    uint32_t lastFrame;
    uint8_t *indexed,*bgra;
    uint16_t *rgb555;
    uint16_t palette[256][3],grey[64];
    uint8_t logo[320*200];
    uint16_t logo555[320*200];
    BlitzPoint path[1024],circle[40];
} BlitzCore;
int blitz_core_init(BlitzCore *,int,int,const char *);
void blitz_core_destroy(BlitzCore *);
void blitz_core_frame(BlitzCore *,uint32_t);
void blitz_core_logo(BlitzCore *);
void blitz_core_expand(BlitzCore *,int);
void blitz_core_depth(BlitzCore *,int);
#endif
