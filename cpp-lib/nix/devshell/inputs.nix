{
  pkgs,
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

{
  packages = with pkgs; [
    clang-tidy-check
    clang-tidy-fix
    clang-format-check
    clang-format-fix
    cpp-check
    include-what-you-use
    fish
  ];

  nativeBuildInputs = [
    cmake
    clang-tools
  ];
}
