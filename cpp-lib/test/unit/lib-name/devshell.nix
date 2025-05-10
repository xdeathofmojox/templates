{
  pkgs ? import <nixpkgs> { },
  cmake,
  clang-tools,
  gtest,
  # TODO: Rename lib-name
  lib-name,
}:

pkgs.mkShell {
  nativeBuildInputs = [
    cmake
    clang-tools
  ];
  buildInputs = [
    gtest
    # TODO: Rename lib-name
    lib-name
  ];
  packages = with pkgs; [
    clang-tidy-check
    clang-tidy-fix
  ];
  shellHook = "";
}
