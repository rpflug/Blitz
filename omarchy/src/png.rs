use std::{
    ffi::{c_int, c_ulong},
    fs,
    path::Path,
};

#[cfg_attr(target_os = "windows", link(name = "z", kind = "static"))]
#[cfg_attr(not(target_os = "windows"), link(name = "z"))]
unsafe extern "C" {
    fn compressBound(source_len: c_ulong) -> c_ulong;
    fn compress2(
        dest: *mut u8,
        dest_len: *mut c_ulong,
        source: *const u8,
        source_len: c_ulong,
        level: c_int,
    ) -> c_int;
}

fn crc32(bytes: &[u8]) -> u32 {
    let mut crc = !0u32;
    for &byte in bytes {
        crc ^= byte as u32;
        for _ in 0..8 {
            crc = (crc >> 1) ^ (0xedb88320u32 & (0u32.wrapping_sub(crc & 1)));
        }
    }
    !crc
}

fn chunk(out: &mut Vec<u8>, kind: &[u8; 4], data: &[u8]) {
    out.extend_from_slice(&(data.len() as u32).to_be_bytes());
    out.extend_from_slice(kind);
    out.extend_from_slice(data);
    let mut check = Vec::with_capacity(4 + data.len());
    check.extend_from_slice(kind);
    check.extend_from_slice(data);
    out.extend_from_slice(&crc32(&check).to_be_bytes());
}

pub fn save(path: &Path, bgra: &[u8], width: usize, height: usize) -> Result<(), String> {
    let mut raw = Vec::with_capacity(height * (1 + width * 4));
    for row in 0..height {
        raw.push(0);
        for pixel in bgra[row * width * 4..(row + 1) * width * 4].chunks_exact(4) {
            raw.extend_from_slice(&[pixel[2], pixel[1], pixel[0], 255]);
        }
    }
    let mut compressed = vec![0u8; unsafe { compressBound(raw.len() as c_ulong) } as usize];
    let mut compressed_len = compressed.len() as c_ulong;
    let status = unsafe {
        compress2(
            compressed.as_mut_ptr(),
            &mut compressed_len,
            raw.as_ptr(),
            raw.len() as c_ulong,
            6,
        )
    };
    if status != 0 {
        return Err(format!("PNG compression failed ({status})"));
    }
    compressed.truncate(compressed_len as usize);
    let mut png = b"\x89PNG\r\n\x1a\n".to_vec();
    let mut ihdr = Vec::new();
    ihdr.extend_from_slice(&(width as u32).to_be_bytes());
    ihdr.extend_from_slice(&(height as u32).to_be_bytes());
    ihdr.extend_from_slice(&[8, 6, 0, 0, 0]);
    chunk(&mut png, b"IHDR", &ihdr);
    chunk(&mut png, b"IDAT", &compressed);
    chunk(&mut png, b"IEND", &[]);
    fs::write(path, png).map_err(|e| e.to_string())
}
