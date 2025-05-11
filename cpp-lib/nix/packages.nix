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
  lib-name-unit-tests = pkgs.callPackage ./../test/unit/lib-name { };
}
