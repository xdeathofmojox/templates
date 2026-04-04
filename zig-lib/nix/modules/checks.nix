{ inputs, ... }:
{
  perSystem =
    { config, ... }:
    {
      checks = {
        fmt-check = config.treefmt.build.check inputs.self;
      };
    };
}
