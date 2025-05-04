{ pkgs, ... }:
rec {
  # TODO: Rename lib-name
  default = lib-name;
  # TODO: Rename lib-name
  lib-name = pkgs.lib-name;
  # TODO: Rename lib-name
  lib-name-static = lib-name.override { static = true; };
  # TODO: Rename lib-name
  lib-name-debug = lib-name.override { debug = true; };
  # TODO: Rename lib-name
  lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name { };
  # TODO: Rename lib-name
  lib-name-cpp-check = pkgs.callPackage ./nix/static-analysis/cpp-check.nix {
    src = pkgs.lib-name.src;
  };
  # TODO: Rename lib-name
  lib-name-clang-tidy = pkgs.callPackage ./nix/static-analysis/clang-tidy.nix {
    src = pkgs.lib-name.src;
  };
}
