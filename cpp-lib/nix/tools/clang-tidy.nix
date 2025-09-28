{
  clang-tools,
  cmake,
  writeShellApplication,
  in_place ? false,
}:

writeShellApplication {
  name = if in_place then "clang-tidy-fix" else "clang-tidy-check";
  runtimeInputs = [
    clang-tools
    cmake
  ];
  text = ''
    set -e

    WORK_DIR=$(pwd)
    CMAKE_DIR=$(mktemp -d)

    cmake "$WORK_DIR" -B "$CMAKE_DIR" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    SOURCE_FILES=$(find "$WORK_DIR" \( -name "*.cc" -o -name "*.cpp" \) -not -path "*/build/*" -not -path "*/CMakeFiles/*")
    if [ -n "$SOURCE_FILES" ]; then
      echo "$SOURCE_FILES" | xargs clang-tidy \
          -p "$CMAKE_DIR" \
          ${
            if in_place then "--fix" else "--export-fixes=clang-tidy-fixes.yaml --warnings-as-errors='*'"
          }
    else
      echo "No source files found to check"
    fi

    rm -rf "$CMAKE_DIR"
  '';
}
