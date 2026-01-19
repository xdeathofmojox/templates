{
  # TODO: Update description
  description = "Rust Cargo Workspace with Nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      fenix,
      treefmt-nix,
    }:
    let
      lib = import ./nix/lib.nix {
        inherit
          self
          nixpkgs
          fenix
          treefmt-nix
          ;
      };
    in
    {
      legacyPackages = lib.forEachSupportedSystem (args: args.pkgs);

      packages = lib.forEachSupportedSystem (args: import ./nix/packages.nix args.pkgs);

      apps = lib.forEachSupportedSystem (args: import ./nix/apps.nix args.pkgs);

      formatter = lib.forEachSupportedSystem (args: args.treefmtEval.config.build.wrapper);

      devShells = lib.forEachSupportedSystem (args: import ./nix/devshells.nix args.pkgs);

      overlays.default = import ./overlay.nix;
    };
}
