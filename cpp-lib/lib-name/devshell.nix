{
  pkgs ? import <nixpkgs> { },
  cmake,
  clang-tools,
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    cmake
    clang-tools
  ];
  shellHook = "";
}
