{
  # TODO: Rename lib-name
  lib-name-unit-tests,
  ...
}:
let
  # TODO: Rename lib-name
  lib-name-unit-tests-app = {
    type = "app";
    meta = {
      description = "My library unit tests";
      owner = "xdeathofmojox";
    };
    # TODO: Rename lib-name
    program = "${lib-name-unit-tests}/bin/lib-name-unit-tests";
  };
in
{
  # TODO: Rename lib-name
  lib-name-unit-tests = lib-name-unit-tests-app;
  # TODO: Rename lib-name
  default = lib-name-unit-tests-app;
}
