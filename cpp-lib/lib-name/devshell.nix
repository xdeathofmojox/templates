{
  mkShell,
  cmake,
}:

mkShell {
  nativeBuildInputs = [
    cmake
  ];

  shellHook = '''';
}
