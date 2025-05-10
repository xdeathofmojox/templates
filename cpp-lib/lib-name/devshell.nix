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
  packages = with pkgs; [
    clang-tidy-check
    clang-tidy-fix
    clang-format-check
    clang-format-fix
  ];
  shellHook = "";
}
