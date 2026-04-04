{ ... }:
{
  perSystem =
    { pkgs, fenix, ... }:
    let
      toolchain = fenix.stable.withComponents [
        "cargo"
        "clippy"
        "rustc"
        "rustfmt"
        "rust-src"
      ];
    in
    {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          toolchain
          fenix.rust-analyzer
          cargo-audit
          cargo-geiger
          cargo-machete
          cargo-nextest
          cargo-tarpaulin
        ];
      };
    };
}
