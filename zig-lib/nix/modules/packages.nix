{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        default = pkgs.lib-name;
        inherit (pkgs)
          lib-name
          ;
      };
      legacyPackages = pkgs;
    };
}
