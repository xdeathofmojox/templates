{
  pkgs ? import <nixpkgs> { },
  ...
}@args:

# Import base devShell
import ../nix/devshell/base.nix args
