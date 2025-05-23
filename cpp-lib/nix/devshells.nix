{ pkgs, ... }:
let
  clang-tidy-check = pkgs.callPackage ./tools/clang-tidy.nix { };
  clang-tidy-fix = pkgs.callPackage ./tools/clang-tidy.nix { in_place = true; };
  clang-format-check = pkgs.callPackage ./tools/clang-format.nix { };
  clang-format-fix = pkgs.callPackage ./tools/clang-format.nix { in_place = true; };
  cpp-check = pkgs.callPackage ./tools/cpp-check.nix { };
  include-what-you-use = pkgs.callPackage ./tools/include-what-you-use.nix { };
in
rec {
  # TODO: Rename lib-name
  default = lib-name;
  # TODO: Rename lib-name
  lib-name = pkgs.callPackage ./../lib-name/devshell.nix {
    inherit
      clang-tidy-check
      clang-tidy-fix
      clang-format-check
      clang-format-fix
      cpp-check
      include-what-you-use
      ;
  };
  # TODO: Rename lib-name
  lib-name-unit-tests = pkgs.callPackage ./../test/unit/lib-name/devshell.nix {
    inherit
      clang-tidy-check
      clang-tidy-fix
      clang-format-check
      clang-format-fix
      cpp-check
      include-what-you-use
      ;
  };
}
