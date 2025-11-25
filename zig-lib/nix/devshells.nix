{ callPackage, ... }:

let
  # TODO: Rename lib-name
  lib-name = callPackage ./../lib-name/devshell.nix { };
in
{
  # TODO: Rename lib-name
  inherit lib-name;
  # TODO: Rename lib-name
  default = lib-name;
}
