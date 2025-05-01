{
  pkgs ? import <nixpkgs> { },
  cmake,
  clang-tools,
  gtest,
  # TODO: Rename lib-name
  lib-name,
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    cmake
    clang-tools
    gtest
    # TODO: Rename lib-name
    lib-name
  ];
  shellHook = "";
}
