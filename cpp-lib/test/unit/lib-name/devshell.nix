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
  gtest,
  # TODO: rename lib-name
  lib-name,
}:

# Import base devShell and extend it
let
  inputs = import ../../../nix/devshell/inputs.nix {
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
  };
  base = import ../../../nix/devshell/base.nix {
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
  };
in
pkgs.mkShell {
  # TODO: rename lib-name
  nativeBuildInputs = inputs.nativeBuildInputs ++ [
    gtest
    lib-name
  ];
  packages = inputs.packages;

  shellHook = ''
    echo "🧪 Unit testing environment with gtest and lib-name added!"
    ${base.shellHook}
  '';
}
