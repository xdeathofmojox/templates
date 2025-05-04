{
  # TODO: Update description
  description = "Rust Cargo Workspace with Nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      lib = import ./lib.nix { inherit self nixpkgs; };
    in
    {
      legacyPackages = lib.forEachSupportedSystem (args: args.pkgs);

      packages = lib.forEachSupportedSystem (args: import ./packages.nix args);

      apps = lib.forEachSupportedSystem (args: import ./apps.nix args);

      formatter = lib.forEachSupportedSystem (args: args.pkgs.nixfmt-rfc-style);

      devShells = lib.forEachSupportedSystem (args: import ./devshells.nix args);

      overlays.default = import ./overlay.nix;
    };
}
