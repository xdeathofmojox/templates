{
  self,
  nixpkgs,
  fenix,
  treefmt-nix,
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
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            fenix.overlays.default
            self.overlays.default
          ];
          config = { };
        };
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
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
