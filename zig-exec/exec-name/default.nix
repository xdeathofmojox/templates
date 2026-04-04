{
  stdenv,
  zig,
  # TODO: Rename exec-name
  exec-name-version,
}:

let
  # TODO: Rename exec-name
  project-name = "exec-name";
in
stdenv.mkDerivation rec {
  pname = project-name;
  # TODO: Rename exec-name
  version = "v${exec-name-version.major}.${exec-name-version.minor}.${exec-name-version.patch}";
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
