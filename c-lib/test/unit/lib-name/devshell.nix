{
  mkShell,
  cmake,
  cmocka,
  clang-tidy-check,
  clang-tidy-fix,
  c-check,
  iwyu,
  # TODO: Rename lib-name
  lib-name,
}:

mkShell {
  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    cmocka
    # TODO: Rename lib-name
    lib-name
  ];

  packages = [
    clang-tidy-check
    clang-tidy-fix
    c-check
    iwyu
  ];

  shellHook = "";
}
