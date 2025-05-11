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
}
