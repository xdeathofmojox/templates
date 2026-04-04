{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.callPackage ../../lib-name/devshell.nix { };
    };
}
