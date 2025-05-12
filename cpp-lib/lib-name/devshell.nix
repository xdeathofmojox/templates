{
  pkgs ? import <nixpkgs> { },
  cmake,
  clang-tools,
  clang-tidy-check,
  clang-tidy-fix,
  clang-format-check,
  clang-format-fix,
  cpp-check,
  include-what-you-use,
  ...
}:

# Import base devShell
import ../nix/devshell/base.nix {
  inherit
    pkgs
    cmake
    clang-tools
    clang-tidy-check
    clang-tidy-fix
    clang-format-check
    clang-format-fix
    cpp-check
    include-what-you-use
    ;
}
