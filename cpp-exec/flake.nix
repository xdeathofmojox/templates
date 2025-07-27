{
  # TODO: Update description
  description = "A c++ executable template";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    treefmt-nix.url = "github:numtide/treefmt-nix";

    # Add more flakes here
  };

  outputs =
    {
      self,
      nixpkgs,
      treefmt-nix,
    }:

    let
      lib = import ./nix/lib.nix { inherit self nixpkgs treefmt-nix; };
    in
    {
      legacyPackages = lib.forEachSupportedSystem (args: args.pkgs);

      packages = lib.forEachSupportedSystem (args: import ./nix/packages.nix args.pkgs);

      apps = lib.forEachSupportedSystem (args: import ./nix/apps.nix args.pkgs);

      checks = lib.forEachSupportedSystem (args: import ./nix/checks.nix (args.pkgs // args));

      devShells = lib.forEachSupportedSystem (args: import ./nix/devshells.nix args.pkgs);

      formatter = lib.forEachSupportedSystem (args: args.treefmtEval.config.build.wrapper);

      overlays.default = import ./overlay.nix;

    };
}
