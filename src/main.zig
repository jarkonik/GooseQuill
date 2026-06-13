const std = @import("std");
const sdl = @cImport(@cInclude("SDL2/SDL.h"));

const gq = @import("GooseQuill");

pub fn main() u8 {
    gq.hello_world();

    const WIDTH = 800;
    const HEIGHT = 600;

    if (sdl.SDL_Init(sdl.SDL_INIT_EVERYTHING) != 0) {
        std.debug.print("CANNOT INIT SDL\n", .{});
        return 1;
    }

    const window = sdl.SDL_CreateWindow(
        "GooseQuill",
        sdl.SDL_WINDOWPOS_CENTERED,
        sdl.SDL_WINDOWPOS_CENTERED,
        WIDTH,
        HEIGHT,
        sdl.SDL_WINDOW_SHOWN,
    );

    if (window == null) {
        return 1;
    }

    const renderer = sdl.SDL_CreateRenderer(window, -1, sdl.SDL_RENDERER_PRESENTVSYNC);

    if (renderer == null) {
        std.debug.print("CANNOT CREATE REDNERED", .{});
        return 1;
    }

    var window_should_close: bool = false;

    while (!window_should_close) {
        var event: sdl.SDL_Event = undefined;
        while (sdl.SDL_PollEvent(&event) != 0) {
            if (event.type == sdl.SDL_QUIT) {
                window_should_close = true;
            }
        }
    }

    return 0;
}
