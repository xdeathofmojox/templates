{
  mkShell,
  zig,
  zls,
  ...
}:

mkShell {
  packages = [
    zig
    zls
  ];

  shellHook = ''
    echo "Zig executable development shell"
    echo "Zig version: $(zig version)"
  '';
}
