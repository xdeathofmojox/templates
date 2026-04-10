{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem =
    { ... }:
    {
      treefmt.config = {
        projectRootFile = "flake.nix";

        programs = {
          mdformat.enable = true;
          nixfmt.enable = true;
          prettier.enable = true;
          zig.enable = true;
        };

        settings.formatter.prettier.excludes = [ "*.lock" ];
        settings.global.excludes = [ ];
      };
    };
}
