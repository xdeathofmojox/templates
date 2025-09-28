{
  self,
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
  treefmtEval,
  ...
}:

{
  lib-name-unit-tests = runCommand "unit-tests" { } ''
    set -e

    ${lib-name-unit-tests}/bin/lib-name-unit-tests
    mkdir -p $out
  '';

  lib-name-clang-tidy = stdenv.mkDerivation {
    name = "lib-name-clang-tidy";
    src = lib-name.src;
    nativeBuildInputs = [
      clang-tidy-check
    ];
    buildInputs = [
      lib-name
    ];
    buildPhase = ''
      runHook preBuild
      ${clang-tidy-check}/bin/clang-tidy-check
      runHook postBuild
    '';
    installPhase = ''
      runHook preInstall
      mkdir -p $out
      runHook postInstall
    '';
  };

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

  fmt-check = treefmtEval.config.build.check self;
}
