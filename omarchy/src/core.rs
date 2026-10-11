//! Pixel operations translated from the recovered 1.1 and 1.2 PowerPC cores.
const W: usize = 1024;
const H: usize = 768;
const LOGO_W: usize = 320;
const LOGO_H: usize = 200;

#[derive(Clone, Copy, Default)]
struct Point {
    x: i32,
    y: i32,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Version {
    V11,
    V12,
}

pub struct Core {
    version: Version,
    pub depth: u8,
    indexed: Vec<u8>,
    rgb555: Vec<u16>,
    pub bgra: Vec<u8>,
    palette: [[u16; 3]; 256],
    grey: [u16; 64],
    logo: &'static [u8],
    logo555: Vec<u16>,
    path: [Point; 1024],
    circle: [Point; 40],
    last_frame: u32,
    has_frame: bool,
    showing_logo: bool,
}

impl Core {
    pub fn new(version: Version) -> Self {
        let pal = include_bytes!("../../native/Resources/system.palette");
        let mut palette = [[0; 3]; 256];
        for i in 0..256 {
            for j in 0..3 {
                palette[i][j] = u16::from_be_bytes([pal[6 * i + 2 * j], pal[6 * i + 2 * j + 1]]);
            }
        }
        let mut grey = [0u16; 64];
        let mut path = [Point::default(); 1024];
        let mut circle = [Point::default(); 40];
        match version {
            Version::V11 => {
                let pi = 3.141592654f64;
                for (i, p) in path.iter_mut().enumerate() {
                    let twice = 2.0f32 * i as f32;
                    let angle = pi * twice as f64;
                    let a = (angle / 256.0).cos();
                    let b = (angle / 128.0).cos();
                    p.x = ((30000.0 * b) * a) as i32;
                    let wave = (angle / 2048.0).cos();
                    p.y = (6500.0 * ((angle * wave) / 64.0).sin()) as i32;
                }
                for (i, p) in circle.iter_mut().enumerate() {
                    let twice = 2.0f32 * i as f32;
                    let angle = (pi * twice as f64) / 40.0;
                    p.x = (5000.0 * angle.cos()) as i32;
                    p.y = (5000.0 * angle.sin()) as i32;
                }
            }
            Version::V12 => {
                for i in (0..32).step_by(2) {
                    grey[i] = 0x7fff - i as u16 - ((i as u16) << 5) - ((i as u16) << 10);
                    grey[i + 1] = grey[i];
                }
                let pi = 3.141592653f64;
                for (i, p) in path.iter_mut().enumerate() {
                    let angle = pi * (i as f32) as f64;
                    p.x = ((30000.0 * (angle / 64.0).cos()) * (angle / 128.0).cos()) as i16 as i32;
                    let twice = 2.0f32 * i as f32;
                    p.y = (4000.0 * (((pi * twice as f64) * (angle / 1024.0).cos()) / 64.0).sin())
                        as i16 as i32;
                }
                for (i, p) in circle.iter_mut().enumerate() {
                    let angle = (pi * (i as f32) as f64) / 20.0;
                    p.x = (5000.0 * angle.cos()) as i16 as i32;
                    p.y = (5000.0 * angle.sin()) as i16 as i32;
                }
            }
        }
        let logo = include_bytes!("../../native/Resources/logo.indexed");
        let mut logo555 = vec![0; LOGO_W * LOGO_H];
        if version == Version::V12 {
            let source = include_bytes!("../../native/Resources/logo.source.indexed");
            let colors = include_bytes!("../../native/Resources/logo.source.palette");
            for (i, &k) in source.iter().enumerate() {
                let k = k as usize;
                let component = |j: usize| {
                    u16::from_be_bytes([colors[6 * k + 2 * j], colors[6 * k + 2 * j + 1]]) >> 11
                };
                logo555[i] = (component(0) << 10) | (component(1) << 5) | component(2);
            }
        }
        let mut core = Self {
            version,
            depth: if version == Version::V12 { 16 } else { 8 },
            indexed: vec![255; W * H],
            rgb555: vec![0; W * H],
            bgra: vec![0; W * H * 4],
            palette,
            grey,
            logo,
            logo555,
            path,
            circle,
            last_frame: 0,
            has_frame: false,
            showing_logo: true,
        };
        core.logo();
        core
    }

    fn clear(&mut self) {
        self.indexed.fill(255);
        self.rgb555.fill(0);
    }

    pub fn logo(&mut self) {
        self.clear();
        let x = (W - LOGO_W) / 2;
        let y = (H - LOGO_H) / 2;
        for row in 0..LOGO_H {
            let dest = (y + row) * W + x;
            let source = row * LOGO_W;
            self.indexed[dest..dest + LOGO_W].copy_from_slice(&self.logo[source..source + LOGO_W]);
            if self.version == Version::V12 {
                self.rgb555[dest..dest + LOGO_W]
                    .copy_from_slice(&self.logo555[source..source + LOGO_W]);
            }
        }
        self.has_frame = false;
        self.showing_logo = true;
    }

    pub fn frame(&mut self, frame: u32) {
        match self.version {
            Version::V11 => {
                self.indexed.fill(255);
                let t = frame as i32;
                let base = (t & 1023) as usize;
                for layer in (t % 3)..100 {
                    let moving = ((t + layer) & 1023) as usize;
                    let divisor = layer * 3 + 10;
                    for p in self.circle {
                        let x = W as i32 / 2
                            + (p.x + self.path[moving].x - self.path[base].x) / divisor;
                        let y = H as i32 / 2
                            + (p.y + self.path[moving].y - self.path[base].y) / divisor;
                        let x = x as i16 as i32;
                        let y = y as i16 as i32;
                        if x >= 0 && y >= 0 && x < W as i32 && y < H as i32 {
                            self.indexed[y as usize * W + x as usize] = 0;
                        }
                    }
                }
            }
            Version::V12 => {
                if self.showing_logo || !self.has_frame {
                    self.clear();
                } else {
                    self.points(self.last_frame, true);
                }
                self.points(frame, false);
                self.last_frame = frame;
                self.has_frame = true;
                self.showing_logo = false;
            }
        }
    }

    fn points(&mut self, frame: u32, erase: bool) {
        let t = frame as i16 as i32;
        let base = (t & 1023) as usize;
        for layer in (t % 3)..63 {
            let moving = ((t + layer) & 1023) as usize;
            let divisor = layer * 3 + 10;
            let color = if layer == -1 {
                0xff00
            } else if layer == -2 {
                0
            } else {
                self.grey[layer as usize]
            };
            for p in self.circle {
                let x = W as i32 / 2 + (p.x + self.path[moving].x - self.path[base].x) / divisor;
                let y = H as i32 / 2 + (p.y + self.path[moving].y - self.path[base].y) / divisor;
                if x >= 0 && y >= 0 && x < W as i32 && y < H as i32 {
                    let k = y as usize * W + x as usize;
                    self.indexed[k] = if erase { 255 } else { 0 };
                    self.rgb555[k] = if erase { 0 } else { color };
                }
            }
        }
    }

    pub fn expand(&mut self, fade: u8) {
        let fade = fade.min(100) as u32;
        if self.depth == 8 {
            let mut lut = [[0u8; 4]; 256];
            for (i, entry) in lut.iter_mut().enumerate() {
                for j in 0..3 {
                    entry[2 - j] = (((self.palette[i][j] >> 8) as u32 * fade) / 100) as u8;
                }
                entry[3] = 255;
            }
            for (pixels, &index) in self.bgra.chunks_exact_mut(4).zip(&self.indexed) {
                pixels.copy_from_slice(&lut[index as usize]);
            }
        } else {
            for (pixels, &color) in self.bgra.chunks_exact_mut(4).zip(&self.rgb555) {
                for j in 0..3 {
                    let bits = ((color >> (5 * j)) & 31) as u32;
                    pixels[j] = ((((bits << 3) | (bits >> 2)) * fade) / 100) as u8;
                }
                pixels[3] = 255;
            }
        }
    }

    #[cfg(test)]
    pub fn indexed(&self) -> &[u8] {
        &self.indexed
    }
    #[cfg(test)]
    pub fn rgb555(&self) -> &[u16] {
        &self.rgb555
    }
    #[cfg(test)]
    pub fn table_bytes(&self) -> Vec<u8> {
        let mut bytes = Vec::new();
        for p in self.path.iter().chain(self.circle.iter()) {
            if self.version == Version::V11 {
                bytes.extend_from_slice(&p.x.to_be_bytes());
                bytes.extend_from_slice(&p.y.to_be_bytes());
            } else {
                bytes.extend_from_slice(&(p.x as i16).to_be_bytes());
                bytes.extend_from_slice(&(p.y as i16).to_be_bytes());
            }
        }
        if self.version == Version::V12 {
            for word in self.grey {
                bytes.extend_from_slice(&word.to_be_bytes());
            }
        }
        bytes
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::{fs, path::Path, process::Command};

    fn reference(version: Version, dir: &Path) {
        let root = Path::new(env!("CARGO_MANIFEST_DIR")).join("..");
        let source = if version == Version::V11 {
            "native"
        } else {
            "native12"
        };
        let executable = dir.join("reference");
        let status = Command::new("cc")
            .args(["-O2", "-ffp-contract=off"])
            .arg(root.join(source).join("BlitzCore.c"))
            .arg(root.join(source).join("core_check.c"))
            .args(["-lm", "-o"])
            .arg(&executable)
            .status()
            .unwrap();
        assert!(status.success());
        let status = Command::new(&executable)
            .arg(root.join("native/Resources"))
            .arg(dir)
            .status()
            .unwrap();
        assert!(status.success());
    }

    #[test]
    fn versions_match_existing_native_cores() {
        for version in [Version::V11, Version::V12] {
            let dir = std::env::temp_dir().join(format!(
                "blitz-omarchy-{:?}-{}",
                version,
                std::process::id()
            ));
            fs::create_dir_all(&dir).unwrap();
            reference(version, &dir);
            let mut core = Core::new(version);
            assert_eq!(
                core.table_bytes(),
                fs::read(dir.join("tables.bin")).unwrap(),
                "table mismatch in {version:?}"
            );
            if version == Version::V11 {
                for frame in [0, 1, 60, 256, 1023] {
                    core.frame(frame);
                    core.expand(100);
                    let bytes = fs::read(dir.join(format!("frame-{frame:04}.ppm"))).unwrap();
                    let header = b"P6\n1024 768\n255\n";
                    assert_eq!(&bytes[..header.len()], header);
                    for (rgb, bgra) in bytes[header.len()..]
                        .chunks_exact(3)
                        .zip(core.bgra.chunks_exact(4))
                    {
                        assert_eq!(rgb, &[bgra[2], bgra[1], bgra[0]], "frame {frame}");
                    }
                }
            } else {
                let frames = [
                    0, 1, 2, 60, 256, 1023, 1024, 32767, 32768, 32769, 65535, 65536,
                ];
                for mode in [8, 16] {
                    core.depth = mode;
                    core.logo();
                    for frame in frames {
                        core.frame(frame);
                        compare_12(&core, &dir, frame, mode);
                    }
                }
                for mode in [8, 16] {
                    core.depth = mode;
                    core.logo();
                    for frame in 0..121 {
                        core.frame(frame);
                    }
                    compare_12(&core, &dir, 120, mode);
                }
            }
            fs::remove_dir_all(&dir).unwrap();
        }
    }

    fn compare_12(core: &Core, dir: &Path, frame: u32, mode: u8) {
        let expected = fs::read(dir.join(format!("frame-{frame}-{mode}.bin"))).unwrap();
        if mode == 8 {
            assert_eq!(core.indexed(), expected, "frame {frame}, depth {mode}");
        } else {
            let actual: Vec<u8> = core
                .rgb555()
                .iter()
                .flat_map(|word| word.to_be_bytes())
                .collect();
            assert_eq!(actual, expected, "frame {frame}, depth {mode}");
        }
    }
}
