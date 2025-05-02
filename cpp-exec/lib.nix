{ self, nixpkgs }:

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
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
          config = { };
        };
      in
      f {
        inherit self system pkgs;
      }
    );
in
{
  inherit supportedSystems forEachSupportedSystem;
}
