/* Hand-reconstructed, C-like pseudocode for PowerPC section0:0x28..0x6c8.
 * NOT original source and NOT a buildable replacement.
 * fn_HEX names identify unresolved internal routines by section-relative offset.
 * API names are verified through PEF imports/relocations.
 * Read/write macros express memory access, not recovered original types.
 * Floating operations in the executable include single-precision rounding;
 * the simplified expressions below capture the algorithm, not bit-exact results.
 */

void blitz_body(void) {
    /* 0x3c..0x50: pointers into the data section; most are zero-initialized globals. */
    void *music_slot = DATA + 0x4024;
    Point32 *circle = DATA + 0x192c;
    Point32 *path = DATA + 0x1bac;
    void *device_slot = DATA + 0x3bb8;
    void *pixmap_slot = DATA + 0x3bb4;
    void *quickdraw_state = DATA + 0x3f54;
    int frame = 0;

    InitGraf(quickdraw_state + 0xca);                /* 0x58..0x60 */
    InitWindows();                                 /* 0x64 */
    FlushEvents(0xffff, 0);                         /* 0x6c..0x7c */
    fn_006cc(1);                                    /* cache screen/device state */
    int original_depth = READ16S(DEREF_HANDLE(READPTR(pixmap_slot)) + 0x20);
    int current_depth = original_depth;            /* 0x8c..0x98 */
    if (current_depth != 8) {                       /* 0x9c..0xa4 */
        if (!HasDepth(READPTR(device_slot), 8, 0, 0))
            return;                                /* 0xa8..0xc4 -> 0x6b4 */
        SetDepth(READPTR(device_slot), 8, 0, 0);     /* 0xc8..0xdc; result ignored */
        current_depth = READ16S(DEREF_HANDLE(READPTR(pixmap_slot)) + 0x20);
    }
    fn_006cc(1);                                    /* refresh cached screen state */
    fn_02560(DATA + 0x5f8);                          /* unresolved initialization */
    unsigned char settings[/* size not reconstructed */];
    fn_01b10(settings);                             /* initializes a settings block */
    WRITE8(settings + 0x10, 1);                     /* stack0x48 - stack0x38 */
    WRITE32(settings + 0x12, 50);                    /* packed structure */
    if ((int16_t)fn_01d30(settings) != 0)
        DebugStr(DATA + 0x88c);                     /* 0x134..0x144 */
    fn_02724('MADH', 128);                          /* embedded music resource */

    int width = READ16S(quickdraw_state + 0x5c) - READ16S(quickdraw_state + 0x58);
    int height = READ16S(quickdraw_state + 0x5a) - READ16S(quickdraw_state + 0x56);
    int center_x = width / 2, center_y = height / 2; /* signed division toward zero */
    if (fn_00978() & 0xff) {                        /* 0x184..0x1b4 */
        fn_00ad4();
        for (int level = 100; level >= 0; level -= 5)
            fn_00c84(level);                        /* verified byte scaling / fade */
    }
    Rect bounds;
    SetRect(&bounds, 0, 0, width, height);           /* 0x1b8..0x1e0 */
    void *window = NewCWindow(0, &bounds, DATA + 0x5f8,
                              1, 0, (void *)-1, 0, 0);
    fn_00778();                                    /* unresolved graphics setup */
    SetPort(window);
    ForeColor(33);
    PaintRect(&bounds);
    HideCursor();                                  /* 0x218..0x240 */
    fn_008e0(0, 128, (width - 320) / 2, (height - 200) / 2);
    for (int level = 0; level <= 100; level += 5)
        fn_00c84(level);                            /* 0x284..0x29c */

    const double pi = 3.141592654;                  /* actual stored constant */
    for (int i = 0; i < 1024; ++i) {                /* 0x2a0..0x3d0 */
        double angle = pi * (2.0f * (float)i);
        path[i].x = (int32_t)(30000.0 * cos(angle / 128.0) * cos(angle / 256.0));
        path[i].y = (int32_t)(6500.0 * sin(angle * cos(angle / 2048.0) / 64.0));
    }
    for (int i = 0; i < 40; ++i) {                  /* 0x3d4..0x490 */
        double angle = pi * (2.0f * (float)i) / 40.0;
        circle[i].x = (int32_t)(5000.0 * cos(angle));
        circle[i].y = (int32_t)(5000.0 * sin(angle));
    }
    ForeColor(33);
    PaintRect(&bounds);
    fn_031b0();                                     /* 0x4ac; likely music control */
    WRITE8(READPTR(music_slot) + 0x3250, 1);         /* original field name unknown */

    while (!(Button() & 0xff)) {                    /* 0x59c..0x5a8 */
        ForeColor(33);
        fn_008a0();                                 /* unresolved frame preparation */
        PaintRect(&bounds);
        int base = frame & 1023;                    /* 0x4f4..0x4fc */
        for (int layer = frame % 3; layer < 100; ++layer) {
            int moving = (frame + layer) & 1023;
            int divisor = 3 * layer + 10;
            for (int j = 0; j < 40; ++j) {
                int x = center_x + (circle[j].x + path[moving].x - path[base].x) / divisor;
                int y = center_y + (circle[j].y + path[moving].y - path[base].y) / divisor;
                put_pixel_00ff8((int16_t)x, (int16_t)y, 0);
            }
        }
        ++frame;
    }
    for (int level = 100; level >= 0; level -= 5) {  /* 0x5ac..0x604 */
        fn_00c84(level);
        for (int off = 0x3148; off <= 0x3154; off += 4) {
            void *state = READPTR(music_slot);
            WRITE32(state + off, READ32(state + off) - 3);
        }
    }
    fn_03288();
    WRITE8(READPTR(music_slot) + 0x3250, 0);
    fn_02414();
    fn_026a0();
    ShowCursor();
    fn_007e4(window);
    DisposeWindow(window);
    for (int level = 0; level <= 100; level += 5)
        fn_00c84(level);
    fn_00d90();
    if ((int16_t)original_depth != (int16_t)current_depth)
        SetDepth(READPTR(device_slot), original_depth, 0, 0);
    FlushEvents(0xffff, 0);
    ExitToShell();                                  /* 0x6ac */
}

/* 0xff8..0x105c: direct framebuffer byte write with signed 16-bit clipping. */
void put_pixel_00ff8(int16_t x, int16_t y, unsigned char color) {
    if (x < 0 || x >= screen_width) return;
    if (y < 0 || y >= screen_height) return;
    unsigned char *base = READPTR(DATA + 0x3bc4);
    int16_t row_bytes = READ16S(DATA + 0x3bc8);
    base[row_bytes * y + x] = color;
}
