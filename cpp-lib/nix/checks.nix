{
  cmake,
  clang-tools,
  cppcheck,
  libxml2,
  stdenv,
  lib-name,
  lib-name-unit-tests,
  clang-tidy-check,
  cpp-check,
  runCommand,
  ...
}:

{
  lib-name-unit-tests = runCommand "unit-tests" { } ''
    set -e

    ${lib-name-unit-tests}/bin/lib-name-unit-tests
    mkdir -p $out
  '';

  lib-name-clang-tidy =
    runCommand "clang-tidy"
      {
        nativeBuildInputs = [
          cmake
          clang-tools
          stdenv.cc
        ];
      }
      ''
        set -e

        cd ${lib-name.src}
        ${clang-tidy-check}/bin/clang-tidy-check
        mkdir -p $out
      '';

  lib-name-cpp-check =
    runCommand "cpp-check"
      {
        buildInputs = [
          cppcheck
          libxml2
        ];
      }
      ''
        set -e
        WORK_DIR=$(mktemp -d)
        cp -r ${lib-name.src}/* $WORK_DIR
        cd $WORK_DIR
        ${cpp-check}/bin/cpp-check
        mkdir -p $out
      '';
}
