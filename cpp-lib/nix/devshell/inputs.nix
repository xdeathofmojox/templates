{
  pkgs,
  cmake,
  clang-tools,
}:

{
  packages = with pkgs; [
    clang-tidy-check
    clang-tidy-fix
    clang-format-check
    clang-format-fix
    cpp-check
    fish
  ];

  nativeBuildInputs = [
    cmake
    clang-tools
  ];
}
