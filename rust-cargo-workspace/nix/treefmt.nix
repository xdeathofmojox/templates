{ ... }:
{
  projectRootFile = "flake.nix";

  programs = {
    nixfmt.enable = true;
    shfmt.enable = true;
    shellcheck.enable = true;
    mdformat.enable = true;
    clang-format.enable = true;
    rustfmt.enable = true;
  };

  settings.global.excludes = [ ];
}
