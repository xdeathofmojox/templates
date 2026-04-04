{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        default = pkgs.exec-name;
        inherit (pkgs) exec-name;
      };
      legacyPackages = pkgs;
    };
}
