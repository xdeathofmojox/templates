{
  pkgs,
  ...
}@args:

let
  inputs = import ./inputs.nix args;
in
pkgs.mkShell {
  inherit (inputs) packages nativeBuildInputs;

  shellHook = ''
  '';
}
