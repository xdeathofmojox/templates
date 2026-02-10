{
  mkShell,
  cargo-audit,
  cargo-machete,
  cargo-nextest,
  fenix,
  ...
}:
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
  default = mkShell {
    buildInputs = [
      toolchain
      fenix.rust-analyzer
      cargo-audit
      cargo-machete
      cargo-nextest
    ];
  };
}
