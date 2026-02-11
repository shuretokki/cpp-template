# project

C++ personal starter project using Nix + Meson.

## what you need

- [Nix](https://nixos.org/download) with flakes enabled
- [direnv](https://direnv.net/) (optional)

## getting started

```bash
git clone https://github.com/shuretokki/cpp-template project
cd project

# if you have direnv:
direnv allow

# if you don't have direnv:
nix develop
```

First time setup; configure the build directory:

```bash
meson setup build
```

You only run this once. Or again if you change `meson.build` or add new dependencies.

## compiling and running

```bash
# compile
meson compile -C build

# run
./build/project
```

## what's inside the dev shell

`clang++` `clangd` `clang-tidy` `clang-format` `gdb` `valgrind` `cppcheck` `ccache` `meson` `ninja`

## adding dependencies

Two places. Always both.

1. Add the library to `buildInputs` in `flake.nix`:

```nix
buildInputs = [ pkgs.spdlog pkgs.new-lib ];
```

2. Add it to your `meson.build`:

```meson
dependencies: [
    dependency('spdlog'),
    dependency('new-lib'),
],
```

3. Reload and reconfigure:

```bash
direnv reload # or exit and re-enter nix develop
meson setup build --wipe
```