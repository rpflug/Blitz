#ifndef BLITZ_MUSIC_H
#define BLITZ_MUSIC_H
#include <stddef.h>
#ifdef __cplusplus
extern "C" {
#endif
typedef struct BlitzMusic BlitzMusic;
BlitzMusic *blitz_music_create(const char *path, int *error);
BlitzMusic *blitz_music_create_memory(const void *data, size_t size, int *error);
void blitz_music_destroy(BlitzMusic *music);
void blitz_music_render(BlitzMusic *music, float *left, float *right, size_t frames);
void blitz_music_set_playing(BlitzMusic *music, int playing);
void blitz_music_set_fade(BlitzMusic *music, int step);
void blitz_music_restart(BlitzMusic *music);
int blitz_music_rate(void);
#ifdef __cplusplus
}
#endif
#endif
