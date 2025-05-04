{
  # TODO: Update description
  description = "A c++ library template";

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
      lib = import ./lib.nix { inherit self nixpkgs; };
    in
    {
      legacyPackages = lib.forEachSupportedSystem (args: args.pkgs);

      packages = lib.forEachSupportedSystem (args: import ./packages.nix args);

      apps = lib.forEachSupportedSystem (args: import ./apps.nix args);

      devShells = lib.forEachSupportedSystem (args: import ./devshells.nix args);

      formatter = lib.forEachSupportedSystem (args: args.pkgs.nixfmt-rfc-style);

      overlays.default = import ./overlay.nix;

    };
}
