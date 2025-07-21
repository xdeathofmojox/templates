{
  mkShell,
  cmake,
  clang-tidy-check,
  clang-tidy-fix,
  cpp-check,
  iwyu,
}:

mkShell {
  nativeBuildInputs = [
    cmake
  ];

  packages = [
    clang-tidy-check
    clang-tidy-fix
    cpp-check
    iwyu
  ];

  shellHook = '''';
}
