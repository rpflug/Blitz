use crate::sdl;
use std::{
    ffi::{c_int, c_void},
    ptr,
    sync::{
        atomic::{AtomicBool, Ordering},
        Mutex,
    },
};

#[repr(C)]
struct BlitzMusic {
    _private: [u8; 0],
}

unsafe extern "C" {
    fn blitz_music_create_memory(
        data: *const c_void,
        size: usize,
        error: *mut c_int,
    ) -> *mut BlitzMusic;
    fn blitz_music_destroy(music: *mut BlitzMusic);
    fn blitz_music_render(music: *mut BlitzMusic, left: *mut f32, right: *mut f32, frames: usize);
    fn blitz_music_set_playing(music: *mut BlitzMusic, playing: c_int);
    fn blitz_music_set_fade(music: *mut BlitzMusic, fade: c_int);
    fn blitz_music_restart(music: *mut BlitzMusic);
}

struct State {
    music: *mut BlitzMusic,
    muted: AtomicBool,
    scratch: Mutex<(Vec<f32>, Vec<f32>)>,
}

extern "C" fn callback(userdata: *mut c_void, stream: *mut u8, bytes: c_int) {
    let state = unsafe { &*(userdata as *const State) };
    let frames = (bytes as usize) / 8;
    let output = unsafe { std::slice::from_raw_parts_mut(stream as *mut f32, frames * 2) };
    let Ok(mut scratch) = state.scratch.lock() else {
        output.fill(0.0);
        return;
    };
    let (left, right) = &mut *scratch;
    if left.len() < frames {
        left.resize(frames, 0.0);
        right.resize(frames, 0.0);
    }
    unsafe {
        blitz_music_render(state.music, left.as_mut_ptr(), right.as_mut_ptr(), frames);
    }
    let muted = state.muted.load(Ordering::Relaxed);
    for (i, stereo) in output.chunks_exact_mut(2).enumerate() {
        stereo[0] = if muted { 0.0 } else { left[i] };
        stereo[1] = if muted { 0.0 } else { right[i] };
    }
}

pub struct Audio {
    device: u32,
    state: Box<State>,
}

impl Audio {
    pub fn new() -> Result<Self, String> {
        let song = include_bytes!("../../native/Resources/blitz.madh");
        let mut error = 0;
        let music =
            unsafe { blitz_music_create_memory(song.as_ptr().cast(), song.len(), &mut error) };
        if music.is_null() {
            return Err(format!("MADH music could not be decoded (error {error})"));
        }
        unsafe {
            blitz_music_set_playing(music, 0);
        }
        let mut state = Box::new(State {
            music,
            muted: AtomicBool::new(false),
            scratch: Mutex::new((vec![0.0; 4096], vec![0.0; 4096])),
        });
        let wanted = sdl::AudioSpec::new(callback, (&mut *state as *mut State).cast());
        let device =
            unsafe { sdl::SDL_OpenAudioDevice(ptr::null(), 0, &wanted, ptr::null_mut(), 0) };
        if device == 0 {
            unsafe {
                blitz_music_destroy(music);
            }
            return Err(format!("Audio output could not start: {}", sdl::error()));
        }
        unsafe {
            sdl::SDL_PauseAudioDevice(device, 0);
        }
        Ok(Self { device, state })
    }
    pub fn playing(&self, value: bool) {
        unsafe {
            blitz_music_set_playing(self.state.music, value as c_int);
        }
    }
    pub fn fade(&self, step: i32) {
        unsafe {
            blitz_music_set_fade(self.state.music, step);
        }
    }
    pub fn restart(&self) {
        unsafe {
            blitz_music_restart(self.state.music);
        }
    }
    pub fn mute(&self, muted: bool) {
        self.state.muted.store(muted, Ordering::Relaxed);
    }
}

impl Drop for Audio {
    fn drop(&mut self) {
        unsafe {
            sdl::SDL_CloseAudioDevice(self.device);
            blitz_music_destroy(self.state.music);
        }
    }
}
