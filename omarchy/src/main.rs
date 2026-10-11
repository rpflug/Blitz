#![cfg_attr(target_os = "windows", windows_subsystem = "windows")]

mod audio;
mod core;
mod png;
mod sdl;

use audio::Audio;
use core::{Core, Version};
use std::{
    ffi::{c_void, CString},
    path::PathBuf,
    process::Command,
    ptr,
    time::Instant,
};

const W: i32 = 1024;
const H: i32 = 768;

#[derive(Clone, Copy, PartialEq, Eq)]
enum Phase {
    Logo,
    Play,
    Fade,
    Done,
}

struct App {
    core: Core,
    audio: Audio,
    window: *mut sdl::Window,
    renderer: *mut sdl::Renderer,
    texture: *mut sdl::Texture,
    version: Version,
    phase: Phase,
    phase_step: i32,
    frame: u32,
    speed: f64,
    accumulator: f64,
    last_time: Instant,
    paused: bool,
    muted: bool,
    fullscreen: bool,
}

impl App {
    fn new(version: Version) -> Result<Self, String> {
        if unsafe { sdl::SDL_Init(sdl::INIT_VIDEO | sdl::INIT_AUDIO) } != 0 {
            return Err(sdl::error());
        }
        unsafe {
            sdl::SDL_SetHint(
                b"SDL_RENDER_SCALE_QUALITY\0".as_ptr().cast(),
                b"0\0".as_ptr().cast(),
            );
        }
        let name = if version == Version::V12 {
            "Blitz 1.2"
        } else {
            "Blitz"
        };
        let title = CString::new(name).unwrap();
        let window = unsafe {
            sdl::SDL_CreateWindow(
                title.as_ptr(),
                0x2fff0000,
                0x2fff0000,
                W,
                H,
                sdl::WINDOW_SHOWN | sdl::WINDOW_RESIZABLE | sdl::WINDOW_ALLOW_HIGHDPI,
            )
        };
        if window.is_null() {
            return Err(sdl::error());
        }
        let mut renderer = unsafe {
            sdl::SDL_CreateRenderer(
                window,
                -1,
                sdl::RENDERER_ACCELERATED | sdl::RENDERER_PRESENTVSYNC,
            )
        };
        if renderer.is_null() {
            renderer = unsafe { sdl::SDL_CreateRenderer(window, -1, 0) };
        }
        if renderer.is_null() {
            return Err(sdl::error());
        }
        let texture = unsafe {
            sdl::SDL_CreateTexture(
                renderer,
                sdl::PIXELFORMAT_ARGB8888,
                sdl::TEXTUREACCESS_STREAMING,
                W,
                H,
            )
        };
        if texture.is_null() {
            return Err(sdl::error());
        }
        let audio = Audio::new()?;
        let mut core = Core::new(version);
        if version == Version::V12 {
            let cfg = include_str!("../../analysis-1.2/original/Blitz.cfg");
            core.depth = if cfg.starts_with("16") { 16 } else { 8 };
        }
        let mut app = Self {
            core,
            audio,
            window,
            renderer,
            texture,
            version,
            phase: Phase::Logo,
            phase_step: 0,
            frame: 0,
            speed: 1.0,
            accumulator: 0.0,
            last_time: Instant::now(),
            paused: false,
            muted: false,
            fullscreen: false,
        };
        app.render_current();
        Ok(app)
    }

    fn render_current(&mut self) {
        let fade = match self.phase {
            Phase::Logo => {
                self.core.logo();
                self.phase_step * 5
            }
            Phase::Play => {
                self.core.frame(self.frame);
                100
            }
            Phase::Fade => {
                self.core.frame(self.frame);
                100 - self.phase_step * 5
            }
            Phase::Done => {
                self.core.frame(self.frame);
                0
            }
        };
        self.core.expand(fade.clamp(0, 100) as u8);
        unsafe {
            sdl::SDL_UpdateTexture(
                self.texture,
                ptr::null(),
                self.core.bgra.as_ptr().cast::<c_void>(),
                W * 4,
            );
        }
        self.present();
        let name = if self.version == Version::V12 {
            "Blitz 1.2"
        } else {
            "Blitz"
        };
        let phase = match self.phase {
            Phase::Logo => "Synergy 96",
            Phase::Done => "Finished",
            _ => "Synergy Design 1996",
        };
        let title = CString::new(format!(
            "{name} — {phase} — frame {} — {:.2}×",
            self.frame, self.speed
        ))
        .unwrap();
        unsafe {
            sdl::SDL_SetWindowTitle(self.window, title.as_ptr());
        }
    }

    fn present(&self) {
        let (mut dw, mut dh) = (0, 0);
        unsafe {
            sdl::SDL_GetRendererOutputSize(self.renderer, &mut dw, &mut dh);
        }
        let mut scale = (dw as f64 / W as f64).min(dh as f64 / H as f64);
        if scale >= 1.0 {
            scale = scale.floor();
        }
        let (w, h) = ((W as f64 * scale) as i32, (H as f64 * scale) as i32);
        let dest = sdl::Rect {
            x: (dw - w) / 2,
            y: (dh - h) / 2,
            w,
            h,
        };
        unsafe {
            sdl::SDL_SetRenderDrawColor(self.renderer, 0, 0, 0, 255);
            sdl::SDL_RenderClear(self.renderer);
            sdl::SDL_RenderCopy(self.renderer, self.texture, ptr::null(), &dest);
            sdl::SDL_RenderPresent(self.renderer);
        }
    }

    fn advance(&mut self) {
        match self.phase {
            Phase::Logo => {
                self.phase_step += 1;
                if self.phase_step > 20 {
                    self.phase = Phase::Play;
                    self.phase_step = 0;
                    self.frame = 0;
                    self.audio.playing(true);
                }
            }
            Phase::Play => self.frame = self.frame.wrapping_add(1),
            Phase::Fade => {
                self.phase_step += 1;
                if self.phase_step > 20 {
                    self.phase = Phase::Done;
                    self.audio.playing(false);
                } else {
                    self.audio.fade(self.phase_step + 1);
                }
            }
            Phase::Done => {}
        }
    }

    fn toggle_pause(&mut self) {
        self.paused = !self.paused;
        self.audio
            .playing(!self.paused && matches!(self.phase, Phase::Play | Phase::Fade));
        self.last_time = Instant::now();
    }

    fn replay(&mut self) {
        self.phase = Phase::Logo;
        self.phase_step = 0;
        self.frame = 0;
        self.accumulator = 0.0;
        self.paused = false;
        self.audio.playing(false);
        self.audio.restart();
        self.last_time = Instant::now();
        self.render_current();
    }

    fn finish(&mut self) {
        match self.phase {
            Phase::Play => {
                self.phase = Phase::Fade;
                self.phase_step = 0;
                self.audio.fade(1);
                self.paused = false;
                self.audio.playing(true);
            }
            Phase::Logo => {
                self.phase = Phase::Done;
                self.audio.playing(false);
                self.render_current();
            }
            _ => {}
        }
    }

    fn save_frame(&mut self) {
        let was_paused = self.paused;
        if !was_paused {
            self.toggle_pause();
        }
        let default = std::env::current_dir()
            .unwrap_or_else(|_| PathBuf::from("."))
            .join(format!("Blitz-frame-{:06}.png", self.frame));
        let path = choose_save_path(&default);
        if let Some(path) = path {
            if let Err(error) = png::save(&path, &self.core.bgra, W as usize, H as usize) {
                eprintln!("Could not save frame: {error}");
            }
        }
        if !was_paused {
            self.toggle_pause();
        }
    }

    fn run(&mut self) {
        let mut running = true;
        while running {
            let mut event = [0u8; 56];
            while unsafe { sdl::SDL_PollEvent(event.as_mut_ptr()) } != 0 {
                match sdl::event_type(&event) {
                    sdl::QUIT => running = false,
                    sdl::MOUSEBUTTONDOWN => self.finish(),
                    sdl::WINDOWEVENT
                        if event[12] == sdl::WINDOWEVENT_EXPOSED
                            || event[12] == sdl::WINDOWEVENT_SIZE_CHANGED =>
                    {
                        self.present()
                    }
                    sdl::KEYDOWN if !sdl::key_repeat(&event) => {
                        let key = sdl::key(&event);
                        let command = sdl::key_mod(&event) & (sdl::KMOD_CTRL | sdl::KMOD_GUI) != 0;
                        if command {
                            match key {
                                45 => {
                                    self.speed = (self.speed - 0.1).max(0.1);
                                    self.render_current();
                                }
                                61 => {
                                    self.speed = (self.speed + 0.1).min(4.0);
                                    self.render_current();
                                }
                                48 => {
                                    self.speed = 1.0;
                                    self.render_current();
                                }
                                109 => {
                                    self.muted = !self.muted;
                                    self.audio.mute(self.muted);
                                }
                                102 => {
                                    self.fullscreen = !self.fullscreen;
                                    unsafe {
                                        sdl::SDL_SetWindowFullscreen(
                                            self.window,
                                            if self.fullscreen {
                                                sdl::WINDOW_FULLSCREEN_DESKTOP
                                            } else {
                                                0
                                            },
                                        );
                                    }
                                }
                                115 => self.save_frame(),
                                113 => running = false,
                                49 if self.version == Version::V12 => {
                                    self.core.depth = 8;
                                    self.render_current();
                                }
                                50 if self.version == Version::V12 => {
                                    self.core.depth = 16;
                                    self.render_current();
                                }
                                _ => {}
                            }
                        } else {
                            match key {
                                32 => self.toggle_pause(),
                                114 => self.replay(),
                                46 => {
                                    if !self.paused {
                                        self.toggle_pause();
                                    }
                                    self.advance();
                                    self.audio.playing(false);
                                    self.render_current();
                                }
                                27 => self.finish(),
                                _ => {}
                            }
                        }
                    }
                    _ => {}
                }
            }
            let now = Instant::now();
            let elapsed = now.duration_since(self.last_time).as_secs_f64();
            self.last_time = now;
            if !self.paused && self.phase != Phase::Done {
                self.accumulator += elapsed.min(0.25) * 60.0 * self.speed;
                let mut changed = false;
                while self.accumulator >= 1.0 {
                    self.advance();
                    self.accumulator -= 1.0;
                    changed = true;
                }
                if changed {
                    self.render_current();
                }
            }
            unsafe {
                sdl::SDL_Delay(8);
            }
        }
    }
}

#[cfg(not(target_os = "windows"))]
fn choose_save_path(default: &std::path::Path) -> Option<PathBuf> {
    Command::new("zenity")
        .args([
            "--file-selection",
            "--save",
            "--confirm-overwrite",
            "--title=Save Current Frame",
            "--filename",
        ])
        .arg(default)
        .output()
        .ok()
        .and_then(|result| {
            if result.status.success() {
                Some(PathBuf::from(
                    String::from_utf8_lossy(&result.stdout).trim(),
                ))
            } else {
                None
            }
        })
}

#[cfg(target_os = "windows")]
fn choose_save_path(default: &std::path::Path) -> Option<PathBuf> {
    const DIALOG: &str = r#"$OutputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; Add-Type -AssemblyName System.Windows.Forms; $d=New-Object System.Windows.Forms.SaveFileDialog; $d.Title='Save Current Frame'; $d.Filter='PNG image (*.png)|*.png'; $d.FileName=$env:BLITZ_SAVE_DEFAULT; if($d.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){[Console]::Write($d.FileName)}"#;
    let output = Command::new("powershell.exe")
        .args(["-NoLogo", "-NoProfile", "-STA", "-Command", DIALOG])
        .env("BLITZ_SAVE_DEFAULT", default)
        .output()
        .ok()?;
    if !output.status.success() || output.stdout.is_empty() {
        return None;
    }
    Some(PathBuf::from(
        String::from_utf8_lossy(&output.stdout).trim(),
    ))
}

impl Drop for App {
    fn drop(&mut self) {
        unsafe {
            sdl::SDL_DestroyTexture(self.texture);
            sdl::SDL_DestroyRenderer(self.renderer);
            sdl::SDL_DestroyWindow(self.window);
        }
    }
}

fn main() {
    let version = if std::env::args().any(|arg| arg == "--1.1") {
        Version::V11
    } else {
        Version::V12
    };
    match App::new(version) {
        Ok(mut app) => {
            app.run();
            drop(app);
            unsafe {
                sdl::SDL_Quit();
            }
        }
        Err(error) => {
            eprintln!("Blitz could not start: {error}");
            unsafe {
                sdl::SDL_Quit();
            }
            std::process::exit(1);
        }
    }
}
