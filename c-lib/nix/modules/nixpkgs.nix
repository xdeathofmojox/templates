{ inputs, ... }:
{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          (final: _prev: {
            clang-tidy-check = final.callPackage ../tools/clang-tidy.nix { };
            clang-tidy-fix = final.callPackage ../tools/clang-tidy.nix { in_place = true; };
            c-check = final.callPackage ../tools/c-check.nix { };
            iwyu = final.callPackage ../tools/include-what-you-use.nix { };
          })
          inputs.self.overlays.default
        ];
        config = { };
      };
    };
}
