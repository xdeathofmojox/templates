{
  # TODO: Update description
  description = "A c++ executable template";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Add more flakes here
  };

  outputs =
    {
      self,
      nixpkgs,
    }:

    let
      lib = import ./nix/lib.nix { inherit self nixpkgs; };
    in
    {
      legacyPackages = lib.forEachSupportedSystem (args: args.pkgs);

      packages = lib.forEachSupportedSystem (args: import ./nix/packages.nix args);

      apps = lib.forEachSupportedSystem (args: import ./nix/apps.nix args);

      devShells = lib.forEachSupportedSystem (args: import ./nix/devshells.nix args);

      formatter = lib.forEachSupportedSystem (args: args.pkgs.nixfmt-rfc-style);

      overlays.default = import ./overlay.nix;

    };
}
