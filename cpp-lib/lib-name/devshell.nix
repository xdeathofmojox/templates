{
  pkgs ? import <nixpkgs> { },
  cmake,
  clang-tools,
}:

# Import base devShell
import ../nix/base-devshell.nix { inherit pkgs cmake clang-tools; }
