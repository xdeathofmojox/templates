{
  # TODO: Update description
  description = "Rust Cargo Workspace with Nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      lib = import ./nix/lib.nix { inherit self nixpkgs; };
    in
    {
      legacyPackages = lib.forEachSupportedSystem (args: args.pkgs);

      packages = lib.forEachSupportedSystem (args: import ./nix/packages.nix args);

      apps = lib.forEachSupportedSystem (args: import ./nix/apps.nix args);

      formatter = lib.forEachSupportedSystem (args: args.pkgs.nixfmt-rfc-style);

      devShells = lib.forEachSupportedSystem (args: import ./nix/devshells.nix args);

      overlays.default = import ./overlay.nix;
    };
}
