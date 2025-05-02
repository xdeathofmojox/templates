{ pkgs, ... }:
rec {
  # TODO: Rename lib-name
  default = lib-name;
  # TODO: Rename lib-name
  lib-name = pkgs.callPackage ./lib-name/devshell.nix { };
  # TODO: Rename lib-name
  lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name/devshell.nix { };
}
