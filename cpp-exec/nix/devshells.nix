{ pkgs, ... }:
let
  clang-tidy-check = pkgs.callPackage ./tools/clang-tidy.nix { };
  clang-tidy-fix = pkgs.callPackage ./tools/clang-tidy.nix { in_place = true; };
  clang-format-check = pkgs.callPackage ./tools/clang-format.nix { };
  clang-format-fix = pkgs.callPackage ./tools/clang-format.nix { in_place = true; };
  cpp-check = pkgs.callPackage ./tools/cpp-check.nix { };
in
rec {
  # TODO: Rename exec-name
  default = exec-name;
  # TODO: Rename exec-name
  exec-name = pkgs.callPackage ./../exec-name/devshell.nix {
    inherit
      clang-tidy-check
      clang-tidy-fix
      clang-format-check
      clang-format-fix
      cpp-check
      ;
  };
}
