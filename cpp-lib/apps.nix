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
  clang-format-check = {
    type = "app";
    meta = {
      description = "Clang format check";
      owner = "xdeathofmojox";
    };
    program = "${import ./nix/tools/clang-format.nix { inherit pkgs; }}/bin/clang-format";
  };
  clang-format-fix = {
    type = "app";
    meta = {
      description = "Clang format fix";
      owner = "xdeathofmojox";
    };
    program = "${
      import ./nix/tools/clang-format.nix {
        inherit pkgs;
        in_place = true;
      }
    }/bin/clang-format";
  };
  clang-tidy-check = {
    type = "app";
    meta = {
      description = "Clang tidy check";
      owner = "xdeathofmojox";
    };
    program = "${import ./nix/tools/clang-tidy.nix { inherit pkgs; }}/bin/clang-tidy";
  };
  clang-tidy-fix = {
    type = "app";
    meta = {
      description = "Clang tidy fix";
      owner = "xdeathofmojox";
    };
    program = "${
      import ./nix/tools/clang-tidy.nix {
        inherit pkgs;
        in_place = true;
      }
    }/bin/clang-tidy";
  };
}
