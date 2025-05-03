{ pkgs, ... }:
{
  # TODO: Rename lib-name
  default = pkgs.lib-name;
  # TODO: Rename lib-name
  lib-name = pkgs.lib-name;
  # TODO: Rename lib-name
  lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name { };
  # TODO: Rename lib-name
  lib-name-cpp-check = pkgs.callPackage ./lib-name/static-analysis/cpp-check.nix { };
  # TODO: Rename lib-name
  lib-name-clang-tidy = pkgs.callPackage ./lib-name/static-analysis/clang-tidy.nix { };
}
