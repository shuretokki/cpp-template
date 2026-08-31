# project

C++ personal starter project using nix + meson.

## what you need

- [Nix](https://nixos.org/download) with flakes enabled
- [direnv](https://direnv.net/) (optional)

## getting started

```bash
git clone https://github.com/shuretokki/cpp-template project
cd project

# if you have direnv:
direnv allow

# else, you could just:
nix develop
```

Configuring the build directory:

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
Refer to the [Meson Quick Start](https://mesonbuild.com/Quick-guide.html) for detailed guide.

## adding dependencies


1. Add the library to `buildInputs` in `flake.nix`:
Refer to the [Nix.dev Flakes Concept Manual](https://wiki.nixos.org/wiki/Flakes) for how dependencies map to reproducible outputs.

```nix
buildInputs = [ pkgs.spdlog pkgs.new-lib ];
```

2. Add it to your `meson.build`:
Refer to the [Meson Dependency Documentation ](https://mesonbuild.com/Dependencies.html) for detailed syntax and options.

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
