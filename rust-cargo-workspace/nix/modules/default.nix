{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
    ./nixpkgs.nix
    ./packages.nix
    ./devshells.nix
    ./formatting.nix
    ./overlay.nix
  ];
}
