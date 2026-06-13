const std = @import("std");
const Io = std.Io;

const sdl = @cImport(@cInclude("SDL2/SDL.h"));

const gq = @import("GooseQuill");

pub fn main() void {
    gq.hello_world();

    const WIDTH = 800;
    const HEIGHT = 600;

    sdl.SDL_Create_Window(
        "GooseQuill",
        sdl.SDL_WINDOWPOS_CENTERED,
        sdl.SDL_WINDOWPOS_CENTERED,
        WIDTH,
        HEIGHT,
        sdl.SDL_WINDOW_SHOWN,
    );
}
