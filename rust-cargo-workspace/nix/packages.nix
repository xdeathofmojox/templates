{
  workspace-name,
  exec-name,
  lib-name,
  ...
}:
{
  default = workspace-name;
  inherit workspace-name exec-name lib-name;
}
