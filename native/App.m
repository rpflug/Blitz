#import <Cocoa/Cocoa.h>
#import <MetalKit/MetalKit.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#ifdef BLITZ12
#include "../native12/BlitzCore.h"
#define BLITZ_NAME @"Blitz 1.2"
#else
#include "BlitzCore.h"
#define BLITZ_NAME @"Blitz"
#endif
#include "Music.h"

static NSString *const shader=@"#include <metal_stdlib>\nusing namespace metal;\nstruct V{float4 position [[position]];float2 uv;};\nvertex V vtx(uint id [[vertex_id]]){float2 p[4]={float2(-1,1),float2(-1,-1),float2(1,1),float2(1,-1)};float2 uv[4]={float2(0,0),float2(0,1),float2(1,0),float2(1,1)};return {float4(p[id],0,1),uv[id]};}\nfragment float4 frag(V v [[stage_in]],texture2d<float> t [[texture(0)]]){constexpr sampler s(coord::normalized,filter::nearest,address::clamp_to_edge);return t.sample(s,v.uv);}\n";

@class BlitzController;
@interface BlitzView : MTKView
@property(nonatomic,weak) BlitzController *controller;
@end
@interface BlitzController : NSObject <NSApplicationDelegate,NSWindowDelegate,MTKViewDelegate> {
    BlitzCore _core;
    BlitzMusic *_music;
    id<MTLCommandQueue> _queue;
    id<MTLRenderPipelineState> _pipeline;
    id<MTLTexture> _texture;
    AVAudioEngine *_audio;
    AVAudioSourceNode *_source;
    NSTimer *_timer;
    CFTimeInterval _lastTime;
    double _accumulator,_speed;
    uint32_t _frame;
    NSInteger _phase,_phaseStep;
    BOOL _paused,_muted;
    NSMenuItem *_speedLabel,*_pauseItem,*_muteItem;
#ifdef BLITZ12
    NSMenuItem *_depth8,*_depth16;
#endif
    id _terminationObserver;
}
@property(nonatomic,strong) NSWindow *window;
@property(nonatomic,strong) BlitzView *view;
- (void)finishDemo;
- (void)replay:(id)sender;
- (void)togglePause:(id)sender;
- (void)step:(id)sender;
@end
@implementation BlitzView
- (BOOL)acceptsFirstResponder{return YES;}
- (void)mouseDown:(NSEvent *)event{[self.controller finishDemo];}
- (void)keyDown:(NSEvent *)event{
    NSString *key=event.charactersIgnoringModifiers.lowercaseString;
    if([key isEqualToString:@" "])[self.controller togglePause:nil];
    else if([key isEqualToString:@"r"])[self.controller replay:nil];
    else if([key isEqualToString:@"."])[self.controller step:nil];
    else if(event.keyCode==53)[self.controller finishDemo];
    else [super keyDown:event];
}
@end
@implementation BlitzController
- (NSMenuItem *)item:(NSString *)title action:(SEL)action key:(NSString *)key menu:(NSMenu *)menu{
    NSMenuItem *item=[[NSMenuItem alloc]initWithTitle:title action:action keyEquivalent:key];item.target=self;[menu addItem:item];return item;
}
- (void)setupMenus{
    NSMenu *bar=[NSMenu new];NSApp.mainMenu=bar;
    NSMenuItem *app=[NSMenuItem new];[bar addItem:app];NSMenu *appMenu=[[NSMenu alloc]initWithTitle:BLITZ_NAME];app.submenu=appMenu;
    [self item:[@"About " stringByAppendingString:BLITZ_NAME] action:@selector(about:) key:@"" menu:appMenu];
    [appMenu addItem:NSMenuItem.separatorItem];
    NSMenuItem *quit=[[NSMenuItem alloc]initWithTitle:[@"Quit " stringByAppendingString:BLITZ_NAME] action:@selector(terminate:) keyEquivalent:@"q"];[appMenu addItem:quit];
    NSMenuItem *play=[NSMenuItem new];[bar addItem:play];NSMenu *menu=[[NSMenu alloc]initWithTitle:@"Playback"];play.submenu=menu;
    [self item:@"Replay from Beginning" action:@selector(replay:) key:@"r" menu:menu];
    _pauseItem=[self item:@"Pause" action:@selector(togglePause:) key:@"p" menu:menu];
    [self item:@"Advance One Frame" action:@selector(step:) key:@"." menu:menu];
    [self item:@"Finish with Original Fade" action:@selector(finish:) key:@"" menu:menu];
    [menu addItem:NSMenuItem.separatorItem];
    _muteItem=[self item:@"Mute Music" action:@selector(toggleMute:) key:@"m" menu:menu];
    [menu addItem:NSMenuItem.separatorItem];
    _speedLabel=[self item:@"Speed: 1.00× — 60 frames/sec" action:NULL key:@"" menu:menu];_speedLabel.enabled=NO;
    [self item:@"Slower" action:@selector(slower:) key:@"-" menu:menu];
    [self item:@"Faster" action:@selector(faster:) key:@"=" menu:menu];
    [self item:@"Original Tick Speed" action:@selector(normalSpeed:) key:@"0" menu:menu];
    [menu addItem:NSMenuItem.separatorItem];
    [self item:@"Save Current Frame…" action:@selector(saveFrame:) key:@"s" menu:menu];
    [self item:@"Full Screen" action:@selector(fullscreen:) key:@"f" menu:menu];
#ifdef BLITZ12
    NSMenuItem *display=[NSMenuItem new];[bar addItem:display];NSMenu *depthMenu=[[NSMenu alloc]initWithTitle:@"Display"];display.submenu=depthMenu;
    _depth16=[self item:@"16-bit Grayscale (Original Configuration)" action:@selector(depth16:) key:@"2" menu:depthMenu];_depth16.state=NSControlStateValueOn;
    _depth8=[self item:@"8-bit White Points" action:@selector(depth8:) key:@"1" menu:depthMenu];
#endif
}
- (void)applicationDidFinishLaunching:(NSNotification *)notification{
    _speed=1.0;_phase=0;_phaseStep=0;_frame=0;
    [self setupMenus];
    NSString *assets=NSBundle.mainBundle.resourcePath;
    if(!blitz_core_init(&_core,1024,768,assets.fileSystemRepresentation)){[self fail:@"The original Blitz resources could not be loaded."];return;}
#ifdef BLITZ12
    NSString *configuration=[NSString stringWithContentsOfFile:[assets stringByAppendingPathComponent:@"Blitz.cfg"] encoding:NSASCIIStringEncoding error:NULL];
    blitz_core_depth(&_core,[configuration hasPrefix:@"16"]?16:8);_depth8.state=_core.depth==8?NSControlStateValueOn:NSControlStateValueOff;_depth16.state=_core.depth==16?NSControlStateValueOn:NSControlStateValueOff;
#endif
    id<MTLDevice> device=MTLCreateSystemDefaultDevice();
    if(!device){[self fail:@"Metal is unavailable on this Mac."];return;}
    self.view=[[BlitzView alloc]initWithFrame:NSMakeRect(0,0,1024,768) device:device];self.view.controller=self;self.view.delegate=self;
    self.view.colorPixelFormat=MTLPixelFormatBGRA8Unorm;self.view.clearColor=MTLClearColorMake(0,0,0,1);
    self.view.paused=YES;self.view.enableSetNeedsDisplay=YES;
    self.view.framebufferOnly=YES;self.view.autoResizeDrawable=YES;
    CGColorSpaceRef space=CGColorSpaceCreateWithName(kCGColorSpaceSRGB);((CAMetalLayer*)self.view.layer).colorspace=space;CGColorSpaceRelease(space);
    _queue=[device newCommandQueue];NSError *error=nil;
    id<MTLLibrary> library=[device newLibraryWithSource:shader options:nil error:&error];
    if(!library){[self fail:error.localizedDescription];return;}
    MTLRenderPipelineDescriptor *pd=[MTLRenderPipelineDescriptor new];pd.vertexFunction=[library newFunctionWithName:@"vtx"];pd.fragmentFunction=[library newFunctionWithName:@"frag"];pd.colorAttachments[0].pixelFormat=self.view.colorPixelFormat;
    _pipeline=[device newRenderPipelineStateWithDescriptor:pd error:&error];
    if(!_pipeline){[self fail:error.localizedDescription];return;}
    MTLTextureDescriptor *td=[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:MTLPixelFormatBGRA8Unorm width:1024 height:768 mipmapped:NO];td.usage=MTLTextureUsageShaderRead;td.storageMode=MTLStorageModeShared;
    _texture=[device newTextureWithDescriptor:td];
    self.window=[[NSWindow alloc]initWithContentRect:NSMakeRect(0,0,1024,768) styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
    self.window.title=@"Blitz — Synergy Design 1996";self.window.delegate=self;self.window.contentView=self.view;
    self.window.contentAspectRatio=NSMakeSize(4,3);self.window.minSize=NSMakeSize(512,384);[self.window center];[self.window makeKeyAndOrderFront:nil];[self.window makeFirstResponder:self.view];
    [NSApp activateIgnoringOtherApps:YES];
    int musicError=0;NSString *musicPath=[assets stringByAppendingPathComponent:@"blitz.madh"];
    _music=blitz_music_create(musicPath.fileSystemRepresentation,&musicError);
    if(!_music){[self fail:[NSString stringWithFormat:@"The original MADH music could not be decoded (error %d).",musicError]];return;}
    _audio=[AVAudioEngine new];
    AVAudioFormat *format=[[AVAudioFormat alloc]initStandardFormatWithSampleRate:blitz_music_rate() channels:2];
    BlitzMusic *music=_music;
    _source=[[AVAudioSourceNode alloc]initWithFormat:format renderBlock:^OSStatus(BOOL *silent,const AudioTimeStamp *stamp,AVAudioFrameCount count,AudioBufferList *buffers){
        if(buffers->mNumberBuffers!=2){*silent=YES;for(UInt32 i=0;i<buffers->mNumberBuffers;i++)memset(buffers->mBuffers[i].mData,0,buffers->mBuffers[i].mDataByteSize);return noErr;}
        blitz_music_render(music,buffers->mBuffers[0].mData,buffers->mBuffers[1].mData,count);*silent=NO;return noErr;
    }];
    [_audio attachNode:_source];[_audio connect:_source to:_audio.mainMixerNode format:format];
    _audio.mainMixerNode.outputVolume=1.0f;
    blitz_music_set_playing(_music,0);[_audio prepare];
    if(![_audio startAndReturnError:&error]){[self fail:[@"Audio output could not start: " stringByAppendingString:error.localizedDescription]];return;}
    _lastTime=CACurrentMediaTime();
    _timer=[NSTimer timerWithTimeInterval:1.0/120.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];[[NSRunLoop mainRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    [self renderCurrent];
}
- (void)fail:(NSString*)message{NSAlert*a=[NSAlert new];a.messageText=@"Blitz could not start";a.informativeText=message;[a runModal];[NSApp terminate:nil];}
- (void)renderCurrent{
    int fade=100;
    if(_phase==0){blitz_core_logo(&_core);fade=(int)_phaseStep*5;}
    else if(_phase==1){blitz_core_frame(&_core,_frame);}
    else if(_phase==2){blitz_core_frame(&_core,_frame);fade=100-(int)_phaseStep*5;}
    else {blitz_core_frame(&_core,_frame);fade=0;}
    blitz_core_expand(&_core,fade);
    [_texture replaceRegion:MTLRegionMake2D(0,0,1024,768) mipmapLevel:0 withBytes:_core.bgra bytesPerRow:4096];
    [self.view setNeedsDisplay:YES];
    self.window.title=[NSString stringWithFormat:@"%@ — %@ — frame %u — %.2f×",BLITZ_NAME,_phase==0?@"Synergy 96":_phase==3?@"Finished":@"Synergy Design 1996",_frame,_speed];
}
- (void)advance{
    if(_phase==0){if(++_phaseStep>20){_phase=1;_phaseStep=0;_frame=0;blitz_music_set_playing(_music,1);}}
    else if(_phase==1){++_frame;}
    else if(_phase==2){++_phaseStep;if(_phaseStep>20){_phase=3;blitz_music_set_playing(_music,0);}else blitz_music_set_fade(_music,(int)_phaseStep+1);}
}
- (void)tick:(NSTimer*)timer{
    CFTimeInterval now=CACurrentMediaTime();double elapsed=now-_lastTime;_lastTime=now;
    if(_paused||_phase==3)return;
    _accumulator+=MIN(elapsed,0.25)*60.0*_speed;
    BOOL changed=NO;while(_accumulator>=1.0){[self advance];_accumulator-=1.0;changed=YES;}
    if(changed)[self renderCurrent];
}
- (void)drawInMTKView:(MTKView*)view{
    MTLRenderPassDescriptor *pass=view.currentRenderPassDescriptor;id<CAMetalDrawable>drawable=view.currentDrawable;if(!pass||!drawable||!_pipeline)return;
    id<MTLCommandBuffer>buffer=[_queue commandBuffer];id<MTLRenderCommandEncoder>encoder=[buffer renderCommandEncoderWithDescriptor:pass];
    double dw=view.drawableSize.width,dh=view.drawableSize.height;
    double scale=MIN(dw/1024.0,dh/768.0);if(scale>=1.0)scale=floor(scale);
    double w=1024*scale,h=768*scale;[encoder setViewport:(MTLViewport){floor((dw-w)/2),floor((dh-h)/2),w,h,0,1}];
    [encoder setRenderPipelineState:_pipeline];[encoder setFragmentTexture:_texture atIndex:0];[encoder drawPrimitives:MTLPrimitiveTypeTriangleStrip vertexStart:0 vertexCount:4];[encoder endEncoding];[buffer presentDrawable:drawable];[buffer commit];[buffer waitUntilCompleted];
}
- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size{[view setNeedsDisplay:YES];}
- (void)finishDemo{if(_phase==1){_phase=2;_phaseStep=0;blitz_music_set_fade(_music,1);_paused=NO;_pauseItem.title=@"Pause";}else if(_phase==0){_phase=3;blitz_music_set_playing(_music,0);[self renderCurrent];}}
- (void)finish:(id)sender{[self finishDemo];}
- (void)replay:(id)sender{_phase=0;_phaseStep=0;_frame=0;_accumulator=0;_paused=NO;_pauseItem.title=@"Pause";blitz_music_set_playing(_music,0);blitz_music_restart(_music);_lastTime=CACurrentMediaTime();[self renderCurrent];}
- (void)togglePause:(id)sender{_paused=!_paused;_pauseItem.title=_paused?@"Resume":@"Pause";blitz_music_set_playing(_music,!_paused&&(_phase==1||_phase==2));_lastTime=CACurrentMediaTime();}
- (void)step:(id)sender{if(!_paused)[self togglePause:nil];[self advance];blitz_music_set_playing(_music,0);[self renderCurrent];}
- (void)toggleMute:(id)sender{_muted=!_muted;_muteItem.title=_muted?@"Unmute Music":@"Mute Music";_audio.mainMixerNode.outputVolume=_muted?0:1.0f;}
- (void)setSpeedValue:(double)value{_speed=fmax(0.1,fmin(4.0,value));_speedLabel.title=[NSString stringWithFormat:@"Speed: %.2f× — %.1f frames/sec",_speed,60*_speed];[self renderCurrent];}
- (void)slower:(id)sender{[self setSpeedValue:_speed-0.1];}
- (void)faster:(id)sender{[self setSpeedValue:_speed+0.1];}
- (void)normalSpeed:(id)sender{[self setSpeedValue:1];}
- (void)fullscreen:(id)sender{[self.window toggleFullScreen:nil];}
#ifdef BLITZ12
- (void)setDepth:(int)depth{blitz_core_depth(&_core,depth);_depth8.state=depth==8?NSControlStateValueOn:NSControlStateValueOff;_depth16.state=depth==16?NSControlStateValueOn:NSControlStateValueOff;[self renderCurrent];}
- (void)depth8:(id)sender{[self setDepth:8];}
- (void)depth16:(id)sender{[self setDepth:16];}
#endif
- (void)about:(id)sender{[NSApp orderFrontStandardAboutPanelWithOptions:@{NSAboutPanelOptionApplicationName:BLITZ_NAME,NSAboutPanelOptionApplicationVersion:@"1996 → macOS",NSAboutPanelOptionCredits:[[NSAttributedString alloc]initWithString:@"Original code and graphics: Frédéric Diebold / Synergy Design\nOriginal music: Monty / Analog\nIn honor of the original program and its makers.\nRecovered 1024 × 768 pixel calculations and original assets.\nMADH playback uses PlayerPRO.\nClick or Escape to finish; Space to pause; R to replay."]}];}
- (void)saveFrame:(id)sender{
    BOOL wasPaused=_paused;if(!wasPaused)[self togglePause:nil];
    NSSavePanel*panel=[NSSavePanel savePanel];panel.nameFieldStringValue=[NSString stringWithFormat:@"Blitz-frame-%06u.png",_frame];
    [panel beginSheetModalForWindow:self.window completionHandler:^(NSModalResponse result){
        if(result==NSModalResponseOK){NSBitmapImageRep*rep=[[NSBitmapImageRep alloc]initWithBitmapDataPlanes:NULL pixelsWide:1024 pixelsHigh:768 bitsPerSample:8 samplesPerPixel:4 hasAlpha:YES isPlanar:NO colorSpaceName:NSDeviceRGBColorSpace bytesPerRow:4096 bitsPerPixel:32];unsigned char*p=rep.bitmapData;for(size_t i=0;i<1024*768;i++){p[4*i]=self->_core.bgra[4*i+2];p[4*i+1]=self->_core.bgra[4*i+1];p[4*i+2]=self->_core.bgra[4*i];p[4*i+3]=255;}NSError*error=nil;BOOL saved=[[rep representationUsingType:NSBitmapImageFileTypePNG properties:@{}]writeToURL:panel.URL options:NSDataWritingAtomic error:&error];if(!saved){NSAlert*a=[NSAlert new];a.messageText=@"Could not save frame";a.informativeText=error.localizedDescription;[a runModal];}}
        if(!wasPaused)[self togglePause:nil];
    }];
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)app{return YES;}
- (void)applicationWillTerminate:(NSNotification*)notification{[_timer invalidate];[_audio stop];if(_source)[_audio detachNode:_source];_source=nil;_audio=nil;blitz_music_destroy(_music);_music=NULL;blitz_core_destroy(&_core);}
@end
int main(int argc,const char*argv[]){@autoreleasepool{NSApplication*app=[NSApplication sharedApplication];[app setActivationPolicy:NSApplicationActivationPolicyRegular];BlitzController*controller=[BlitzController new];app.delegate=controller;[app run];}return 0;}
