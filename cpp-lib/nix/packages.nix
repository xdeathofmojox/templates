{
  # TODO: Rename lib-name
  lib-name,
  # TODO: Rename lib-name
  lib-name-unit-tests,
  ...
}:
{
  # TODO: Rename lib-name
  inherit lib-name lib-name-unit-tests;
  # TODO: Rename lib-name
  default = lib-name;
  # TODO: Rename lib-name
  lib-name-static = lib-name.override { static = true; };
  # TODO: Rename lib-name
  lib-name-debug = lib-name.override { debug = true; };
}
