{
  # TODO: Rename exec-name
  exec-name,
  ...
}:
{
  # TODO: Rename exec-name
  inherit exec-name;
  # TODO: Rename exec-name
  default = exec-name;
  # TODO: Rename exec-name
  exec-name-debug = exec-name.override { debug = true; };
}
