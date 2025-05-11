{
  self,
  system,
  pkgs,
  ...
}:
rec {
  # TODO: Rename lib-name
  default = lib-name-unit-tests;
  # TODO: Rename lib-name
  lib-name-unit-tests = {
    type = "app";
    meta = {
      description = "My library unit tests";
      owner = "xdeathofmojox";
    };
    # TODO: Rename lib-name
    program = "${self.packages.${system}.lib-name-unit-tests}/bin/lib-name-unit-tests";
  };
}
