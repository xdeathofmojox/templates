{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        # TODO: Rename exec-name
        exec-name = pkgs.exec-name;
        default = pkgs.exec-name;
        # TODO: Rename exec-name
        exec-name-debug = pkgs.exec-name.override { debug = true; };
      };
      legacyPackages = pkgs;
    };
}
