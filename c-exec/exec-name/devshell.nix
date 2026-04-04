{
  mkShell,
  cmake,
  clang-tidy-check,
  clang-tidy-fix,
  c-check,
  iwyu,
}:

mkShell {
  nativeBuildInputs = [
    cmake
  ];

  packages = [
    clang-tidy-check
    clang-tidy-fix
    c-check
    iwyu
  ];

  shellHook = "";
}
