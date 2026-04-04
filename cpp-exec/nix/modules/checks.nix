{ inputs, ... }:
{
  perSystem =
    { pkgs, config, ... }:
    {
      checks = {
        exec-name-clang-tidy = pkgs.stdenv.mkDerivation {
          name = "exec-name-clang-tidy";
          src = pkgs.exec-name.src;
          nativeBuildInputs = [
            pkgs.clang-tidy-check
          ];
          buildInputs = [
            pkgs.exec-name
          ];
          buildPhase = ''
            runHook preBuild
            ${pkgs.clang-tidy-check}/bin/clang-tidy-check
            runHook postBuild
          '';
          installPhase = ''
            runHook preInstall
            mkdir -p $out
            runHook postInstall
          '';
        };

        exec-name-cpp-check =
          pkgs.runCommand "cpp-check"
            {
              buildInputs = [
                pkgs.cppcheck
                pkgs.libxml2
              ];
            }
            ''
              set -e
              WORK_DIR=$(mktemp -d)
              cp -r ${pkgs.exec-name.src}/* $WORK_DIR
              cd $WORK_DIR
              ${pkgs.cpp-check}/bin/cpp-check
              mkdir -p $out
            '';

        fmt-check = config.treefmt.build.check inputs.self;
      };
    };
}
