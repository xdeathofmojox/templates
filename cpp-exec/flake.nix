{
  # TODO: Update description
  description = "A c++ executable template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Add more flakes here
  };

  outputs =
    {
      self,
      nixpkgs,
    }:

    let
      lib = import ./lib.nix { inherit nixpkgs self; };
    in
    {
      packages = lib.forEachSupportedSystem (import ./packages.nix);

      devShells = lib.forEachSupportedSystem (import ./devshells.nix);

      formatter = lib.forEachSupportedSystem ({ pkgs }: pkgs.nixfmt-rfc-style);

      overlays.default = import ./overlay.nix;

    };
}
