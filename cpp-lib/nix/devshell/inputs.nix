{
  pkgs ? import <nixpkgs> { },
  ...
}@args:

{
  packages = [
    args.clang-tidy-check
    args.clang-tidy-fix
    args.clang-format-check
    args.clang-format-fix
    args.cpp-check
    args.include-what-you-use
    pkgs.fish
    pkgs.direnv
  ];

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.clang-tools
  ];
}
