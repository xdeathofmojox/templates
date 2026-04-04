{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.callPackage ../../exec-name/devshell.nix { };
    };
}
