{
  lib,
  stdenv,
  zig,
  # TODO: Rename lib-name
  lib-name-version,
}:

let
  # TODO: Rename lib-name
  project-name = "lib-name";
in
stdenv.mkDerivation rec {
  pname = project-name;
  # TODO: Rename lib-name
  version = "v${lib-name-version.major}.${lib-name-version.minor}.${lib-name-version.patch}";
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
