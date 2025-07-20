{
  mkShell,
  cmake,
  gtest,
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

  shellHook = '''';
}
