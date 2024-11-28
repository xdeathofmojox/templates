{
  runCommand,
  clang-tools,
  applyFormat ? true,
}:

runCommand "clang-format" { buildInputs = [ clang-tools ]; } ''
  # Create an output directory
  mkdir -p $out

  changesMade=0

  # Find all source files in $src and copy them to $out, applying clang-format
  for file in $(find $src -name '*.cc' -o -name '*.h'); do
    relativePath=$(realpath --relative-to=$src "$file")
    destFile="$out/$relativePath"
    mkdir -p $(dirname "$destFile")
    clang-format --style=google $file > $destFile

    # Check if the file differs from the original
    if ! diff -q "$file" "$destFile" > /dev/null; then
      echo "File $relativePath was reformatted." >&2
      changesMade=1
    fi
  done

  exit ${if applyFormat then "0" else "$changesMade"}
''