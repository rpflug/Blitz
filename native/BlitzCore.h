#ifndef BLITZ_CORE_H
#define BLITZ_CORE_H
#include <stdint.h>
#include <stddef.h>
typedef struct { int32_t x,y; } BlitzPoint;
typedef struct {
    int width,height;
    uint8_t *indexed,*bgra;
    uint16_t palette[256][3];
    uint8_t logo[320*200];
    BlitzPoint path[1024],circle[40];
} BlitzCore;
int blitz_core_init(BlitzCore *core,int width,int height,const char *resources);
void blitz_core_destroy(BlitzCore *core);
void blitz_core_frame(BlitzCore *core,uint32_t frame);
void blitz_core_logo(BlitzCore *core);
void blitz_core_expand(BlitzCore *core,int fadePercent);
#endif
