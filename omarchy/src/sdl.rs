use std::ffi::{c_char, c_int, c_void};

#[repr(C)]
pub struct Window {
    _private: [u8; 0],
}
#[repr(C)]
pub struct Renderer {
    _private: [u8; 0],
}
#[repr(C)]
pub struct Texture {
    _private: [u8; 0],
}

#[repr(C)]
#[derive(Clone, Copy, Default)]
pub struct Rect {
    pub x: c_int,
    pub y: c_int,
    pub w: c_int,
    pub h: c_int,
}

#[repr(C)]
pub struct AudioSpec {
    pub freq: c_int,
    pub format: u16,
    pub channels: u8,
    pub silence: u8,
    pub samples: u16,
    pub padding: u16,
    pub size: u32,
    pub callback: Option<extern "C" fn(*mut c_void, *mut u8, c_int)>,
    pub userdata: *mut c_void,
}

impl AudioSpec {
    pub fn new(
        callback: extern "C" fn(*mut c_void, *mut u8, c_int),
        userdata: *mut c_void,
    ) -> Self {
        Self {
            freq: 44100,
            format: 0x8120,
            channels: 2,
            silence: 0,
            samples: 1024,
            padding: 0,
            size: 0,
            callback: Some(callback),
            userdata,
        }
    }
}

#[cfg_attr(target_os = "windows", link(name = "SDL2", kind = "static"))]
#[cfg_attr(not(target_os = "windows"), link(name = "SDL2"))]
unsafe extern "C" {
    pub fn SDL_Init(flags: u32) -> c_int;
    pub fn SDL_Quit();
    pub fn SDL_GetError() -> *const c_char;
    pub fn SDL_SetHint(name: *const c_char, value: *const c_char) -> c_int;
    pub fn SDL_CreateWindow(
        title: *const c_char,
        x: c_int,
        y: c_int,
        w: c_int,
        h: c_int,
        flags: u32,
    ) -> *mut Window;
    pub fn SDL_DestroyWindow(window: *mut Window);
    pub fn SDL_SetWindowTitle(window: *mut Window, title: *const c_char);
    pub fn SDL_SetWindowFullscreen(window: *mut Window, flags: u32) -> c_int;
    pub fn SDL_CreateRenderer(window: *mut Window, index: c_int, flags: u32) -> *mut Renderer;
    pub fn SDL_DestroyRenderer(renderer: *mut Renderer);
    pub fn SDL_CreateTexture(
        renderer: *mut Renderer,
        format: u32,
        access: c_int,
        w: c_int,
        h: c_int,
    ) -> *mut Texture;
    pub fn SDL_DestroyTexture(texture: *mut Texture);
    pub fn SDL_UpdateTexture(
        texture: *mut Texture,
        rect: *const Rect,
        pixels: *const c_void,
        pitch: c_int,
    ) -> c_int;
    pub fn SDL_GetRendererOutputSize(
        renderer: *mut Renderer,
        w: *mut c_int,
        h: *mut c_int,
    ) -> c_int;
    pub fn SDL_SetRenderDrawColor(renderer: *mut Renderer, r: u8, g: u8, b: u8, a: u8) -> c_int;
    pub fn SDL_RenderClear(renderer: *mut Renderer) -> c_int;
    pub fn SDL_RenderCopy(
        renderer: *mut Renderer,
        texture: *mut Texture,
        src: *const Rect,
        dst: *const Rect,
    ) -> c_int;
    pub fn SDL_RenderPresent(renderer: *mut Renderer);
    pub fn SDL_PollEvent(event: *mut u8) -> c_int;
    pub fn SDL_Delay(ms: u32);
    pub fn SDL_OpenAudioDevice(
        device: *const c_char,
        capture: c_int,
        desired: *const AudioSpec,
        obtained: *mut AudioSpec,
        allowed_changes: c_int,
    ) -> u32;
    pub fn SDL_PauseAudioDevice(device: u32, pause: c_int);
    pub fn SDL_CloseAudioDevice(device: u32);
}

pub const INIT_VIDEO: u32 = 0x20;
pub const INIT_AUDIO: u32 = 0x10;
pub const WINDOW_SHOWN: u32 = 0x4;
pub const WINDOW_RESIZABLE: u32 = 0x20;
pub const WINDOW_ALLOW_HIGHDPI: u32 = 0x2000;
pub const WINDOW_FULLSCREEN_DESKTOP: u32 = 0x1001;
pub const RENDERER_ACCELERATED: u32 = 0x2;
pub const RENDERER_PRESENTVSYNC: u32 = 0x4;
pub const PIXELFORMAT_ARGB8888: u32 = 0x16362004; // BGRA byte order on little-endian Linux.
pub const TEXTUREACCESS_STREAMING: c_int = 1;
pub const QUIT: u32 = 0x100;
pub const KEYDOWN: u32 = 0x300;
pub const MOUSEBUTTONDOWN: u32 = 0x401;
pub const WINDOWEVENT: u32 = 0x200;
pub const WINDOWEVENT_EXPOSED: u8 = 3;
pub const WINDOWEVENT_SIZE_CHANGED: u8 = 6;
pub const KMOD_CTRL: u16 = 0x00c0;
pub const KMOD_GUI: u16 = 0x0c00;

pub fn event_type(event: &[u8; 56]) -> u32 {
    u32::from_ne_bytes(event[0..4].try_into().unwrap())
}
pub fn key(event: &[u8; 56]) -> i32 {
    i32::from_ne_bytes(event[20..24].try_into().unwrap())
}
pub fn key_mod(event: &[u8; 56]) -> u16 {
    u16::from_ne_bytes(event[24..26].try_into().unwrap())
}
pub fn key_repeat(event: &[u8; 56]) -> bool {
    event[13] != 0
}

pub fn error() -> String {
    unsafe {
        std::ffi::CStr::from_ptr(SDL_GetError())
            .to_string_lossy()
            .into_owned()
    }
}
