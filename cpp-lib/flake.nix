{
  # TODO: Update description
  description = "A c++ library template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # Add more flakes here
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:

    let
      # TODO: Rename lib-name
      lib-name-version = {
        major = "0";
        minor = "0";
        patch = "0";
      };

      overlays = {
        default = final: prev: rec {
          # TODO: Rename lib-name
          inherit lib-name-version;
          # TODO: Rename lib-name
          lib-name = final.callPackage ./lib-name { };
          # TODO: Rename lib-name
          lib-name-static = lib-name.override { static = true; };
        };
      };

    in
    (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = nixpkgs.lib.attrValues overlays;
        };
        # TODO: Rename lib-name
        private-lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name { };
      in
      {
        legacyPackages = pkgs;

        packages = {
          # TODO: Rename lib-name
          default = pkgs.lib-name;
          # TODO: Rename lib-name
          lib-name = pkgs.lib-name;
          # TODO: Rename lib-name
          lib-name-unit-tests = private-lib-name-unit-tests;
        };

        apps = rec {
          # TODO: Rename lib-name
          default = lib-name-unit-tests;
          # TODO: Rename lib-name
          lib-name-unit-tests = {
            type = "app";
            meta = {
              description = "My library unit tests";
              owner = "xdeathofmojox";
            };
            # TODO: Rename lib-name
            program = "${private-lib-name-unit-tests}/bin/lib-name-unit-tests";
          };
        };

        formatter = pkgs.nixfmt-rfc-style;

        # TODO: Rename lib-name
        devShells.default = pkgs.callPackage ./lib-name/devenv.nix { };
        # TODO: Rename lib-name
        devShells.lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name/devenv.nix { };
      }
    ))
    // {
      inherit overlays;
    };
}
