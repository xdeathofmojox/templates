{
  pkgs ? import <nixpkgs> { },
  cmake,
  clang-tools,
}:

pkgs.mkShell {
  nativeBuildInputs = [
    cmake
    clang-tools
  ];
}
