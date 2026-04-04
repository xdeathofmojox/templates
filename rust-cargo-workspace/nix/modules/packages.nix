{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        default = pkgs.workspace-name;
        inherit (pkgs)
          workspace-name
          exec-name
          lib-name
          ;
      };
      legacyPackages = pkgs;
    };
}
