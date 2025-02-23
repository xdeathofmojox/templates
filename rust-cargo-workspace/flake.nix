{
  # TODO: Update description
  description = "Rust Cargo Workspace with Nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    fenix.url = "github:nix-community/fenix";
  };

  outputs = { self, nixpkgs, flake-utils, fenix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        rustToolchain = fenix.packages.${system}.stable.toolchain;
      in {
        packages.default = pkgs.rustPlatform.buildRustPackage {
          pname = "my-workspace";
          version = "0.1.0";
          src = ./.;
          cargoLock.lockFile = ./Cargo.lock;
        };

        devShells.default = pkgs.mkShell {
          packages = [
            rustToolchain
            pkgs.cargo-watch
            pkgs.clippy
          ];
          shellHook = ''
            echo "Rust development environment loaded!"
          '';
        };
      }
    );
}
