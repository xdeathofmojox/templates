{ ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      # TODO: Rename lib-name
      lib-name-unit-tests-app = {
        type = "app";
        meta = {
          description = "My library unit tests";
          owner = "xdeathofmojox";
        };
        # TODO: Rename lib-name
        program = "${pkgs.lib-name-unit-tests}/bin/lib-name-unit-tests";
      };
    in
    {
      apps = {
        # TODO: Rename lib-name
        lib-name-unit-tests = lib-name-unit-tests-app;
        default = lib-name-unit-tests-app;
      };
    };
}
