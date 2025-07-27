{
  self,
  cmake,
  clang-tools,
  cppcheck,
  libxml2,
  stdenv,
  exec-name,
  clang-tidy-check,
  cpp-check,
  runCommand,
  treefmtEval,
  ...
}:

{
  exec-name-clang-tidy =
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

        cd ${exec-name.src}
        ${clang-tidy-check}/bin/clang-tidy-check
        mkdir -p $out
      '';

  exec-name-cpp-check =
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
        cp -r ${exec-name.src}/* $WORK_DIR
        cd $WORK_DIR
        ${cpp-check}/bin/cpp-check
        mkdir -p $out
      '';

  fmt-check = treefmtEval.config.build.check self;
}
