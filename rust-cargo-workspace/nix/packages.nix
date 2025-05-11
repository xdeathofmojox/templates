{ pkgs, ... }:
{
  default = pkgs.workspace-name;
  workspace = pkgs.workspace-name;
  exec-name = pkgs.exec-name;
  lib-name = pkgs.lib-name;
}
