{ ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      # TODO: Rename exec-name
      exec-name = pkgs.callPackage ../../exec-name/devshell.nix { };
    in
    {
      devShells = {
        # TODO: Rename exec-name
        inherit exec-name;
        # TODO: Rename exec-name
        default = exec-name;
      };
    };
}
