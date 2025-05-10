{
  pkgs,
  in_place ? false,
}:

pkgs.writeShellScriptBin "clang-tidy" ''
  set -e
  WORK_DIR=`pwd`
  CMAKE_DIR=`mktemp -d`
  pushd $CMAKE_DIR
  ${pkgs.cmake}/bin/cmake $WORK_DIR -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
  popd

  find . \
      -name "*.cc" \
      -o -name "*.cpp" | \
  xargs ${pkgs.clang-tools}/bin/clang-tidy \
      -p $CMAKE_DIR \
      ${if in_place then "--fix" else "--export-fixes=clang-tidy-fixes.yaml --warnings-as-errors='*'"}

  rm -rf $CMAKE_DIR
''
