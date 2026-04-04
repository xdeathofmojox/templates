{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem =
    { ... }:
    {
      treefmt.config = {
        projectRootFile = "flake.nix";
        programs = {
          clang-format.enable = true;
          cmake-format.enable = true;
          nixfmt.enable = true;
        };
      };
    };
}
