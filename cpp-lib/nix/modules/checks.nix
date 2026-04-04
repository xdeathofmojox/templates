{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      checks = {
        lib-name-unit-tests = pkgs.runCommand "unit-tests" { } ''
          set -e
          ${pkgs.lib-name-unit-tests}/bin/lib-name-unit-tests
          mkdir -p $out
        '';

        lib-name-clang-tidy = pkgs.stdenv.mkDerivation {
          name = "lib-name-clang-tidy";
          src = pkgs.lib-name.src;
          nativeBuildInputs = [
            pkgs.clang-tidy-check
          ];
          buildInputs = [
            pkgs.lib-name
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

        lib-name-cpp-check =
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
              cp -r ${pkgs.lib-name.src}/* $WORK_DIR
              cd $WORK_DIR
              ${pkgs.cpp-check}/bin/cpp-check
              mkdir -p $out
            '';

      };
    };
}
