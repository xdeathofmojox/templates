{ ... }:
{
  perSystem =
    { pkgs, fenix, ... }:
    let
      zigInputs = with pkgs; [
        zig
        zls
      ];
    in
    {
      devShells = {
        default = pkgs.mkShell { buildInputs = zigInputs; };
      };
    };
}
