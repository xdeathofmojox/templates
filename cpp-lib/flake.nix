{
  # TODO: Update description
  description = "A c++ library template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # Add more flakes here
  };

  outputs = {
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
      default = final: priv: rec {
        # TODO: Rename lib-name
        inherit lib-name-version;
        # TODO: Rename lib-name and lib_name
        lib-name = final.callPackage ./lib-name {};
        # TODO: Rename lib-name
        lib-name-static = lib-name.override { static = true; };
        # TODO: Rename lib-name and lib_name
        lib-name-unit-tests = final.callPackage ./test/unit/lib-name {};
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
            # TODO: Rename lib-name
            default = pkgs.lib-name;
            # TODO: Rename lib-name
            lib-name = pkgs.lib-name;
          };

          apps = rec {
            # TODO: Rename lib-name
            default = lib-name-unit-tests;
            # TODO: Rename lib-name
            lib-name-unit-tests = {
              type = "app";
              # TODO: Rename lib-name and lib_name
              program = "${pkgs.lib-name-unit-tests}/bin/lib-name-unit-tests";
            };
          };

          formatter = pkgs.nixfmt-rfc-style;

          # TODO: Rename lib_name
          devShells.default = pkgs.callPackage ./lib-name/devenv.nix { };
          # TODO: Rename lib-name and lib_name
          devShells.lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name/devenv.nix { };
        }
    )) // { inherit overlays; };
}