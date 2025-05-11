{
  pkgs,
  in_place ? false,
}:

pkgs.writeShellApplication {
  name = if in_place then "clang-tidy-fix" else "clang-tidy-check";
  runtimeInputs = [
    pkgs.clang-tools
    pkgs.cmake
  ];
  text = ''
    set -e

    WORK_DIR=$(pwd)
    CMAKE_DIR=$(mktemp -d)

    cmake "$WORK_DIR" -B "$CMAKE_DIR" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    find "$WORK_DIR" \( -name "*.cc" -o -name "*.cpp" \) -print0 | \
    xargs -0 clang-tidy \
        -p "$CMAKE_DIR" \
        ${if in_place then "--fix" else "--export-fixes=clang-tidy-fixes.yaml --warnings-as-errors='*'"}

    rm -rf "$CMAKE_DIR"
  '';
}
