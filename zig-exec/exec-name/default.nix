{
  stdenv,
  zig,
}:

let
  zonContent = builtins.readFile ./build.zig.zon;
  zonFlat = builtins.replaceStrings [ "\n" ] [ " " ] zonContent;
  versionMatch = builtins.match ''.*\.version = "([0-9]+\.[0-9]+\.[0-9]+)".*'' zonFlat;
  version = builtins.head versionMatch;
in
stdenv.mkDerivation {
  # TODO: Rename exec-name
  pname = "exec-name";
  inherit version;
  src = ./.;
  meta = {
    # TODO: Update description
    description = "My Zig executable";
    owner = "xdeathofmojox";
  };
  nativeBuildInputs = [
    zig.hook
  ];
}
