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
  exec-name-clang-tidy = stdenv.mkDerivation {
    name = "exec-name-clang-tidy";
    src = exec-name.src;
    nativeBuildInputs = [
      clang-tidy-check
    ];
    buildInputs = [
      exec-name
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
