{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ { flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      perSystem = { pkgs, lib, ... }: {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "project";
          version = "0.1.0";
          src = ./.;

          nativeBuildInputs = [ pkgs.meson pkgs.ninja pkgs.pkg-config ];
          buildInputs = [ pkgs.spdlog ];
        };

        devShells.default = pkgs.mkShell.override {
          stdenv = pkgs.clangStdenv;
        } {
          nativeBuildInputs = [ pkgs.meson pkgs.ninja pkgs.pkg-config ];
          buildInputs = [ pkgs.spdlog ];
          packages = with pkgs; [ clang-tools gdb valgrind cppcheck ccache ];
        };
      };
    };
}
