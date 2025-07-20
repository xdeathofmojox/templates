{ callPackage, ... }:

let
  # TODO: Rename lib-name
  lib-name = callPackage ./../lib-name/devshell.nix { };
  lib-name-unit-tests = callPackage ./../test/unit/lib-name/devshell.nix { };
in
{
  # TODO: Rename lib-name
  inherit lib-name lib-name-unit-tests;
  # TODO: Rename lib-name
  default = lib-name;
}
