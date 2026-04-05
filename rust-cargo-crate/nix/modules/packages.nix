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
        default = craneLib.buildPackage (commonArgs // { inherit cargoArtifacts; });
        # TODO: Update crate-name
        crate-name = craneLib.buildPackage (commonArgs // { inherit cargoArtifacts; });
      };
      legacyPackages = pkgs;
    };
}
