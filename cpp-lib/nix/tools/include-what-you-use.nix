{
  include-what-you-use,
  writeShellApplication,
}:

writeShellApplication {
  name = "iwyu";
  runtimeInputs = [
    include-what-you-use
  ];
  text = ''
    set -e

    find . -type f \( -name "*.cc" -o -name "*.cpp" \) -print0 | while IFS= read -r -d $'\0' file; do
      include-what-you-use -Xiwyu --error -Iinclude "$file"
    done
  '';
}
