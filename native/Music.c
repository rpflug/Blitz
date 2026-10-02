#include "Music.h"
#include "RDriverInt.h"
#include "MADDriver.h"
#include <stdatomic.h>
#define EMBEDPLUGS 1
#include "Import-Export/MADH/MADH.c"

/* MADH conversion and mixing use PlayerPRO source, see vendor/PlayerPRO/LICENSE.txt.
   Modern audio I/O is separate; no plugin discovery or legacy hardware drivers run. */
struct BlitzMusic {
    MADLibrary *library;
    MADMusic *song;
    MADDriverRec *driver,*initialDriver;
    int16_t *buffer;
    size_t cursor, available;
    atomic_int playing, fade, restart;
};
int blitz_music_rate(void) { return 44100; }
BlitzMusic *blitz_music_create(const char *path, int *error) {
    *error = 0;
    FILE *f = fopen(path, "rb");
    if (!f) { *error=-2; return NULL; }
    fseek(f,0,SEEK_END); long size=ftell(f); rewind(f);
    if (size < sizeof(oldMADSpec)) { fclose(f); *error=-3; return NULL; }
    char *bytes=malloc(size);
    if (!bytes || fread(bytes,1,size,f)!=(size_t)size) { free(bytes);fclose(f);*error=-2;return NULL; }
    fclose(f);
    BlitzMusic *m=calloc(1,sizeof(*m));
    if(!m){free(bytes);*error=-1;return NULL;}
    m->song=calloc(1,sizeof(MADMusic));m->library=calloc(1,sizeof(MADLibrary));
    if(!m->song||!m->library){free(bytes);free(m->song);free(m->library);free(m);*error=-1;return NULL;}
    m->library->IDType='MADD';
    const int periods[12]={1712*16,1616*16,1524*16,1440*16,1356*16,1280*16,1208*16,1140*16,1076*16,1016*16,960*16,907*16};
    memcpy(m->library->mytab,periods,sizeof(periods));
    MADDriverSettings s={0};
    s.numChn=4;s.outPutBits=16;s.outPutMode=DeluxeStereoOutPut;
    s.driverMode=NoHardwareDriver;s.outPutRate=44100;s.oversampling=1;
    s.repeatMusic=true;s.TickRemover=false;s.MicroDelaySize=0;
    int err=MADH2Mad(bytes,size,m->song,&s); free(bytes);
    if (!err) err=MADCreateDriver(&s,m->library,&m->driver);
    if (!err) err=MADAttachDriverToMusic(m->driver,m->song,NULL);
    if (!err) err=MADStartDriver(m->driver);
    if (!err) err=MADPlayMusic(m->driver);
    if (err) { *error=err;blitz_music_destroy(m);return NULL; }
    m->buffer=calloc(1,m->driver->BufSize);if(!m->buffer){*error=-1;blitz_music_destroy(m);return NULL;}m->available=m->driver->ASCBUFFERReal;
    m->initialDriver=malloc(sizeof(MADDriverRec));if(!m->initialDriver){*error=-1;blitz_music_destroy(m);return NULL;}memcpy(m->initialDriver,m->driver,sizeof(MADDriverRec));
    m->cursor=m->available;atomic_init(&m->playing,1);atomic_init(&m->fade,0);atomic_init(&m->restart,0);
    fprintf(stderr,"Blitz MADH: %s, %u channels, %u patterns, %u orders, speed %d, tempo %d; buffer %zu frames\n",m->song->header->name,m->song->header->numChn,m->song->header->numPat,m->song->header->numPointers,m->song->header->speed,m->song->header->tempo,m->available);
    return m;
}
void blitz_music_destroy(BlitzMusic *m) {
    if (!m) return;
    if (m->driver) MADDisposeDriver(m->driver);
    if (m->song) MADDisposeMusic(&m->song,NULL);
    free(m->initialDriver);free(m->buffer);free(m->library);free(m);
}
void blitz_music_render(BlitzMusic *m,float *left,float *right,size_t n) {
    if (!m || !atomic_load(&m->playing)) { memset(left,0,n*sizeof(float));memset(right,0,n*sizeof(float));return; }
    if (atomic_exchange(&m->restart,0)) {
        /* NoHardwareDriver owns no OS handles. Restore the pristine playback state
           on this thread; its allocated mixer buffers keep their original addresses. */
        memcpy(m->driver,m->initialDriver,sizeof(MADDriverRec));m->cursor=m->available;
    }
    /* All driver mutations occur on the audio callback thread. */
    int fade=atomic_load(&m->fade);
    for(int ch=0;ch<4;ch++) m->song->header->chanVol[ch]=(MADByte)(64-fade*3 > 0 ? 64-fade*3 : 0);
    for(size_t i=0;i<n;i++) {
        if(m->cursor>=m->available) {
            MADDirectSaveAlways((char*)m->buffer,NULL,m->driver);m->cursor=0;
        }
        left[i]=m->buffer[2*m->cursor]/32768.0f;
        right[i]=m->buffer[2*m->cursor+1]/32768.0f;
        m->cursor++;
    }
}
void blitz_music_set_playing(BlitzMusic *m,int v){if(m)atomic_store(&m->playing,v);}
void blitz_music_set_fade(BlitzMusic *m,int v){if(m)atomic_store(&m->fade,v<0?0:v>21?21:v);}
void blitz_music_restart(BlitzMusic *m){if(m){atomic_store(&m->fade,0);atomic_store(&m->restart,1);}}
