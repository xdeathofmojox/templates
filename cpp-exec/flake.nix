{
  # TODO: Update description
  description = "A c++ executable template";

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
      # TODO: Rename exec-name
      exec-name-version = {
        major = "0";
        minor = "0";
        patch = "0";
      };

      overlays = {
        default = final: prev: rec {
          # TODO: Rename exec-name
          inherit exec-name-version;
          # TODO: Rename lib-name
          exec-name = final.callPackage ./exec-name { };
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
      in
      {
        legacyPackages = pkgs;

        packages = {
          # TODO: Rename exec-name
          default = pkgs.exec-name;
          # TODO: Rename exec-name
          exec-name = pkgs.exec-name;
        };

        apps = rec {
          # TODO: Rename exec-name
          default = exec-name;
          # TODO: Rename exec-name
          exec-name = {
            type = "app";
            meta = {
              description = "My executable";
              owner = "xdeathofmojox";
            };
            # TODO: Rename exec-name
            program = "${pkgs.exec-name}/bin/exec-name";
          };
        };

        formatter = pkgs.nixfmt-rfc-style;

        devShells = rec {
          # TODO: Rename exec-name
          default = exec-name;
          # TODO: Rename exec-name
          exec-name = pkgs.callPackage ./exec-name/devenv.nix { };
        };
      }
    ))
    // {
      inherit overlays;
    };
}
