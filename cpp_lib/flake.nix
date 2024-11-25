{
  # TODO: Add a better description
  description = "A c++ library template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # TODO: Add more flakes here
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:

  let
    # TODO: Rename this
    lib-name-version = {
      major = "0";
      minor = "0";
      patch = "0";
    };

    overlays = {
      default = final: priv: rec {
        # TODO: Rename lib-name and lib_name
        inherit lib-name-version;
        lib-name = final.callPackage ./lib_name {};
        lib-name-static = lib-name.override { static = true; };
        lib-name-unit-tests = final.callPackage ./test/unit/lib_name {};
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
            default = pkgs.lib-name;
            lib-name = pkgs.lib-name;
          };

          apps = rec {
            default = lib-name-unit-tests;
            lib-name-unit-tests = {
              type = "app";
              program = "${pkgs.lib-name-unit-tests}/bin/lib_name_unit_tests";
            };
          };

          formatter = pkgs.nixfmt-rfc-style;

          devShells.default = pkgs.callPackage ./lib_name/devenv.nix { };
          devShells.lib-name-unit-tests = pkgs.callPackage ./test/unit/lib_name/devenv.nix { };
        }
    )) // { inherit overlays; };
}