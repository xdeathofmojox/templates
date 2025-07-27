{
  self,
  nixpkgs,
  treefmt-nix,
  ...
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
      let
        clang-overlay = final: prev: {
          clang-tidy-check = final.callPackage ./tools/clang-tidy.nix { };
          clang-tidy-fix = final.callPackage ./tools/clang-tidy.nix { in_place = true; };
        };
        cpp-check-overlay = final: prev: {
          cpp-check = final.callPackage ./tools/cpp-check.nix { };
        };
        iwyu-overlay = final: prev: {
          iwyu = final.callPackage ./tools/include-what-you-use.nix { };
        };
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            clang-overlay
            cpp-check-overlay
            iwyu-overlay
            self.overlays.default
          ];
          config = { };
        };
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./fmt/treefmt.nix;
      in
      f {
        inherit
          self
          system
          pkgs
          treefmtEval
          ;
      }
    );
in
{
  inherit supportedSystems forEachSupportedSystem;
}
