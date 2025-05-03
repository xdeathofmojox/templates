{ pkgs, ... }:
{
  default = pkgs.mkShell {
    buildInputs = with pkgs; [
      cargo
      cargo-nextest

      rustc
      rustfmt
      rust-analyzer
    ];
    shellHook = "";
  };
}
