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
          # TODO: Rename lib-name
          overlays = nixpkgs.lib.attrValues overlays;
        };
        # TODO: Rename lib-name
        private-lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name { };
        clang-format = pkgs.callPackage ./clang-format.nix { };
        lib-name-clang-format = clang-format.overrideAttrs(oldAttrs: { src = pkgs.lib-name.src; });
        lib-name-clang-format-check = lib-name-clang-format.override { applyFormat = false; };
        lib-name-unit-tests-clang-format = clang-format.overrideAttrs(oldAttrs: { src = private-lib-name-unit-tests.src; });
        lib-name-unit-tests-clang-format-check = lib-name-unit-tests-clang-format.override { applyFormat = false; };
      in
      {
        legacyPackages = pkgs;

        checks = {
          inherit lib-name-clang-format-check;
          inherit lib-name-unit-tests-clang-format-check;
        };

        packages = {
          # TODO: Rename lib-name
          default = pkgs.lib-name;
          # TODO: Rename lib-name
          lib-name = pkgs.lib-name;
          # TODO: Rename lib-name
          lib-name-unit-tests = private-lib-name-unit-tests;
          inherit lib-name-clang-format;
          inherit lib-name-unit-tests-clang-format;
          inherit lib-name-clang-format-check;
          inherit lib-name-unit-tests-clang-format-check;
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

        # TODO: Rename lib_name
        devShells.default = pkgs.callPackage ./lib-name/devenv.nix { };
        # TODO: Rename lib-name
        devShells.lib-name-unit-tests = pkgs.callPackage ./test/unit/lib-name/devenv.nix { };
      }
    ))
    // {
      inherit overlays;
    };
}
