{
  pkgs ? import <nixpkgs> { },
  ...
}@args:

# Import base devShell and extend it
let
  inputs = import ../../../nix/devshell/inputs.nix args;
  base = import ../../../nix/devshell/base.nix args;
in
pkgs.mkShell {
  # TODO: rename lib-name
  nativeBuildInputs = inputs.nativeBuildInputs ++ [
    pkgs.gtest
    pkgs.lib-name
  ];
  packages = inputs.packages;

  shellHook = ''
    echo "🧪 Unit testing environment with gtest and lib-name added!"
    ${base.shellHook}
  '';
}
