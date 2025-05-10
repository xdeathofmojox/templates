{
  pkgs,
  in_place ? false,
}:

pkgs.writeShellApplication {
  name = if in_place then "clang-format-fix" else "clang-format-check";
  runtimeInputs = [ pkgs.clang-tools ];
  text = ''
    set -e
    echo "Running clang-format recursively..."
    find . -type f \( \
      -name '*.cpp' \
      -o -name '*.hpp' \
      -o -name '*.cc' \
      -o -name '*.h' \) -print0 \
    | xargs -0 clang-format \
      ${if in_place then "-i" else "--Werror --dry-run"}
  '';
}
