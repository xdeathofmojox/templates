{
  pkgs ? import <nixpkgs> {},
  cmake,
  gtest,
  # TODO: Rename lib-name
  lib-name
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    cmake
    gtest
    # TODO: Rename lib-name
    lib-name
  ];
}