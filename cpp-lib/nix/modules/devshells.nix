{ ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      # TODO: Rename lib-name
      lib-name = pkgs.callPackage ../../lib-name/devshell.nix { };
      lib-name-unit-tests = pkgs.callPackage ../../test/unit/lib-name/devshell.nix { };
    in
    {
      devShells = {
        # TODO: Rename lib-name
        inherit lib-name lib-name-unit-tests;
        # TODO: Rename lib-name
        default = lib-name;
      };
    };
}
