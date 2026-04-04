{
  stdenv,
  zig,
  # TODO: Rename exec-name
  exec-name-version,
}:

stdenv.mkDerivation {
  # TODO: Rename exec-name
  pname = "exec-name";
  # TODO: Rename exec-name
  version = "${exec-name-version.major}.${exec-name-version.minor}.${exec-name-version.patch}";
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
