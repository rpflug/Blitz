use std::{env, fs, path::PathBuf, process::Command};

fn copy_dir(source: &std::path::Path, destination: &std::path::Path) {
    fs::create_dir_all(destination).unwrap();
    for entry in fs::read_dir(source).unwrap() {
        let entry = entry.unwrap();
        let target = destination.join(entry.file_name());
        if entry.file_type().unwrap().is_dir() {
            copy_dir(&entry.path(), &target);
        } else {
            fs::copy(entry.path(), target).unwrap();
        }
    }
}

fn main() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..");
    let source = root.join("third_party/PlayerPRO/MADDriver.source");
    println!("cargo:rerun-if-changed={}", source.display());
    println!(
        "cargo:rerun-if-changed={}",
        root.join("native/Resources").display()
    );
    println!(
        "cargo:rerun-if-changed={}",
        root.join("analysis-1.2/original/Blitz.cfg").display()
    );
    let output = PathBuf::from(env::var("OUT_DIR").unwrap());
    let target_os = env::var("CARGO_CFG_TARGET_OS").unwrap();
    let include = output.join("include");
    fs::create_dir_all(&include).unwrap();
    if target_os == "windows" {
        if !include.join("PlayerPROCore").exists() {
            copy_dir(&source, &include.join("PlayerPROCore"));
        }
    } else if !include.join("PlayerPROCore").exists() {
        #[cfg(unix)]
        std::os::unix::fs::symlink(&source, include.join("PlayerPROCore")).unwrap();
    }
    let files = [
        "DelayOutPut.c",
        "Effects.c",
        "MainDriver.c",
        "FileUtils.c",
        "Interrupt.c",
        "MADDriver.c",
        "MyDebugStr.c",
        "OutPut8.c",
        "realft.c",
        "TickRemover.c",
        "stub-VSTPlugIn.c",
        "MIDI-Hardware-Stub.c",
        "Lin-PlugImport.c",
    ];
    let mut objects = Vec::new();
    for file in files.into_iter().chain(["Music.c"]) {
        let original = if file == "Music.c" {
            root.join("native/Music.c")
        } else {
            source.join(file)
        };
        println!("cargo:rerun-if-changed={}", original.display());
        let mut input = original.clone();
        if file == "Interrupt.c" {
            let text = fs::read_to_string(&original).unwrap().replace(
                "temp = (temp * pannValue) / (MAX_PANNING*256L);",
                "int panPercent = (ch->TrackID & 1) ? 70 : 30;\n\t\t\ttemp = (temp * (whichChannel == 1 ? 100 - panPercent : panPercent)) / 100;",
            );
            assert!(text.contains("int panPercent"));
            input = output.join("Interrupt.blitz.c");
            fs::write(&input, text).unwrap();
        } else if file == "MainDriver.c" {
            let text = fs::read_to_string(&original).unwrap().replace(
                "short *shortPtr = (short*)dataCopy;",
                "shortPtr = (short*)dataCopy;",
            );
            input = output.join("MainDriver.portable.c");
            fs::write(&input, text).unwrap();
        }
        let object = output.join(format!("{file}.o"));
        let mut compiler = Command::new("cc");
        compiler.args(["-c", "-O2", "-std=gnu11", "-U__APPLE__"]);
        if target_os == "windows" {
            compiler.args(["-DWIN32", "-D__LITTLE_ENDIAN__", "-DBoolean=bool"]);
        } else {
            compiler.args(["-D__UNIX__", "-D__ELF__", "-D__LITTLE_ENDIAN__"]);
        }
        let status = compiler
            .args([
                "-DBUILDINGPPRO",
                "-DMADCFReadStreamType=2",
                "-Wno-multichar",
                "-Wno-deprecated-declarations",
            ])
            .arg(format!("-I{}", source.display()))
            .arg(format!("-I{}", include.display()))
            .arg(&input)
            .arg("-o")
            .arg(&object)
            .status()
            .expect("could not run C compiler");
        assert!(status.success(), "PlayerPRO compilation failed: {file}");
        objects.push(object);
    }
    let archive = output.join("libblitz_playerpro.a");
    let status = Command::new("ar")
        .arg("crs")
        .arg(&archive)
        .args(&objects)
        .status()
        .unwrap();
    assert!(status.success(), "could not archive PlayerPRO");
    println!("cargo:rustc-link-search=native={}", output.display());
    println!("cargo:rustc-link-lib=static=blitz_playerpro");
    if target_os == "windows" {
        println!("cargo:rustc-link-lib=m");
        println!("cargo:rustc-link-lib=static=z");
        println!("cargo:rustc-link-lib=static=SDL2");
        println!("cargo:rustc-link-arg=-static");
        let output = Command::new("pkg-config")
            .args(["--static", "--libs", "sdl2"])
            .output()
            .expect("pkg-config for SDL2 is required for a static Windows build");
        assert!(output.status.success(), "pkg-config could not find SDL2");
        for arg in String::from_utf8(output.stdout).unwrap().split_whitespace() {
            if let Some(path) = arg.strip_prefix("-L") {
                println!("cargo:rustc-link-search=native={path}");
            } else if let Some(name) = arg.strip_prefix("-l") {
                if name != "SDL2" && name != "SDL2main" {
                    println!("cargo:rustc-link-lib={name}");
                }
            } else if arg.starts_with("-Wl,") {
                println!("cargo:rustc-link-arg={arg}");
            }
        }
    } else {
        println!("cargo:rustc-link-lib=m");
        println!("cargo:rustc-link-lib=z");
        println!("cargo:rustc-link-lib=SDL2");
    }
}
