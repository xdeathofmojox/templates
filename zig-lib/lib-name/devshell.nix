{
  mkShell,
  zig,
  zls,
  lib-name,
  ...
}:

mkShell {
  inputsFrom = [ lib-name ];
  packages = [
    zig
    zls
  ];

  shellHook = ''
    echo "Zig library development shell"
    echo "Zig version: $(zig version)"
  '';
}
