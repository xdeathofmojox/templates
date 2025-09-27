{
  mkShell,
  cmake,
  gtest,
  clang-tidy-check,
  clang-tidy-fix,
  cpp-check,
  iwyu,
  # TODO: Rename lib-name
  lib-name,
}:

mkShell {
  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    gtest
    # TODO: Rename lib-name
    lib-name
  ];

  packages = [
    clang-tidy-check
    clang-tidy-fix
    cpp-check
    iwyu
  ];

  shellHook = '''';
}
