{ ... }:
{
  projectRootFile = "flake.nix";
  programs.nixfmt.enable = true;
  programs.clang-format.enable = true;
  programs.cmake-format.enable = true;
}
