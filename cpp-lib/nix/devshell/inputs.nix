{
  pkgs,
  cmake,
  clang-tools,
  clang-tidy-check,
  clang-tidy-fix,
  clang-format-check,
  clang-format-fix,
  cpp-check,
  ...
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
