{ ... }:
{
  projectRootFile = "flake.nix";

  programs = {
    clang-format.enable = true;
    mdformat.enable = true;
    nixfmt.enable = true;
    rustfmt.enable = true;
    shellcheck.enable = true;
    shfmt.enable = true;
    toml-sort.enable = true;
  };

  settings.global.excludes = [ ];
}
