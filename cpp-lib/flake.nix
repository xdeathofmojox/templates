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
      packages = forEachSupportedSystem (import ./package.nix);

      devShells = forEachSupportedSystem (import ./devshell.nix);

      formatter = forEachSupportedSystem ({ pkgs }: pkgs.nixfmt-rfc-style);

      overlays.default = import ./overlay.nix;

    };
}
