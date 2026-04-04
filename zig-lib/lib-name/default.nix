{
  lib,
  stdenv,
  zig,
  # TODO: Rename lib-name
  lib-name-version,
}:

stdenv.mkDerivation {
  # TODO: Rename lib-name
  pname = "lib-name";
  # TODO: Rename lib-name
  version = "${lib-name-version.major}.${lib-name-version.minor}.${lib-name-version.patch}";
  src = ./.;
  meta = {
    # TODO: Update description
    description = "My Zig library";
    owner = "xdeathofmojox";
  };
  nativeBuildInputs = [
    zig.hook
  ];
  outputs = [
    "out"
    "dev"
  ];
}
