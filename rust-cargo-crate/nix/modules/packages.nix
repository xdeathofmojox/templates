{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        # TODO: Update crate-name
        default = pkgs.crate-name;
        inherit (pkgs) crate-name;
      };
      legacyPackages = pkgs;
    };
}
