{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        # TODO: Rename lib-name
        lib-name = pkgs.lib-name;
        # TODO: Rename lib-name
        lib-name-unit-tests = pkgs.lib-name-unit-tests;
        default = pkgs.lib-name;
        # TODO: Rename lib-name
        lib-name-static = pkgs.lib-name.override { static = true; };
        # TODO: Rename lib-name
        lib-name-debug = pkgs.lib-name.override { debug = true; };
      };
      legacyPackages = pkgs;
    };
}
