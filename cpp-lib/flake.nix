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
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs {
              inherit system;
              overlays = [ self.overlays.default ];
              config = { };
            };
          }
        );
    in
    {
      packages = forEachSupportedSystem (
        { pkgs }:
        {
          # TODO: Rename lib-name
          default = pkgs.lib-name;
          # TODO: Rename lib-name
          lib-name = pkgs.lib-name;
          # TODO: Rename lib-name
          lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name { };
        }
      );

      devShells = forEachSupportedSystem (
        { pkgs }:
        rec {
          # TODO: Rename lib-name
          default = lib-name;
          # TODO: Rename lib-name
          lib-name = pkgs.callPackage ./lib-name/devenv.nix { };
          # TODO: Rename lib-name
          lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name/devenv.nix { };
        }
      );

      formatter = forEachSupportedSystem ({ pkgs, ... }: pkgs.nixfmt-rfc-style);

      overlays.default = import ./overlay.nix;

    };
}
