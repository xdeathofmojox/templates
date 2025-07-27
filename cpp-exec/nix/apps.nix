{
  exec-name,
  ...
}:
let
  # TODO: Rename exec-name
  exec-name-app = {
    type = "app";
    meta = {
      description = "My executable";
      owner = "xdeathofmojox";
    };
    # TODO: Rename exec-name
    program = "${exec-name}/bin/exec-name";
  };
in
{
  # TODO: Rename exec-name
  default = exec-name-app;
  # TODO: Rename exec-name
  exec-name = exec-name-app;
}
