{ nixpkgs, self }:

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
      f {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
          config = { };
        };
      }
    );
in
{
  inherit supportedSystems forEachSupportedSystem;
}
