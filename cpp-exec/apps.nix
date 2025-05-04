{
  self,
  system,
  pkgs,
  ...
}:
rec {
  # TODO: Rename exec-name
  default = exec-name;
  # TODO: Rename exec-name
  exec-name = {
    type = "app";
    meta = {
      description = "My executable";
      owner = "xdeathofmojox";
    };
    # TODO: Rename exec-name
    program = "${self.packages.${system}.exec-name}/bin/exec-name";
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
}
