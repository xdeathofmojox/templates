{ callPackage, ... }:
let
  # TODO: Rename exec-name
  exec-name = callPackage ./../exec-name/devshell.nix { };
in
{
  # TODO: Rename exec-name
  inherit exec-name;
  # TODO: Rename exec-name
  default = exec-name;
}
