{
  pkgs ? import <nixpkgs> { },
  cmake,
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    cmake
  ];
}
