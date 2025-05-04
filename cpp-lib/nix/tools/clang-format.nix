{ pkgs, in_place ? false }:

pkgs.writeShellScriptBin "clang-format" ''
  set -e
  echo "Running clang-format recursively..."
  find . -type f \( -name '*.cpp' -o -name '*.hpp' -o -name '*.cc' -o -name '*.h' \) \
    | xargs ${pkgs.clang-tools}/bin/clang-format --verbose ${if in_place then "-i" else "--dry-run --Werror"}
''