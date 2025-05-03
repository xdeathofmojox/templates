{ pkgs, ... }:
rec {
  # TODO: Rename exec-name
  default = exec-name;
  # TODO: Rename exec-name
  exec-name = pkgs.callPackage ./exec-name/devshell.nix { };
}
