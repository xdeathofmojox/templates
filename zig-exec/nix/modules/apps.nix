{ ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      # TODO: Rename exec-name
      exec-name-app = {
        type = "app";
        meta = {
          description = "My Zig executable";
          owner = "xdeathofmojox";
        };
        # TODO: Rename exec-name
        program = "${pkgs.exec-name}/bin/exec-name";
      };
    in
    {
      apps = {
        # TODO: Rename exec-name
        default = exec-name-app;
        # TODO: Rename exec-name
        exec-name = exec-name-app;
      };
    };
}
