{ ... }:
{
  perSystem =
    {
      pkgs,
      craneLib,
      commonArgs,
      cargoArtifacts,
      ...
    }:
    {
      packages = {
        default = craneLib.buildPackage (
          commonArgs
          // {
            inherit cargoArtifacts;
          }
        );
        # TODO: Update crate-name
        workspace-name = craneLib.buildPackage (
          commonArgs
          // {
            inherit cargoArtifacts;
          }
        );
        exec-name = craneLib.buildPackage (
          commonArgs
          // craneLib.crateNameFromCargoToml { cargoToml = ./../../crates/exec-name/Cargo.toml; }
          // {
            inherit cargoArtifacts;
            cargoExtraArgs = "-p exec-name";
          }
        );
        lib-name = craneLib.buildPackage (
          commonArgs
          // craneLib.crateNameFromCargoToml { cargoToml = ./../../crates/lib-name/Cargo.toml; }
          // {
            inherit cargoArtifacts;
            cargoExtraArgs = "-p lib-name";
          }
        );
      };
      legacyPackages = pkgs;
    };
}
