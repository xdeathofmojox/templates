{
  stdenv,
  cmake,
  static ? false,
  # TODO: Rename lib-name
  lib-name-version,
}:

stdenv.mkDerivation rec {
  # TODO: Rename lib-name
  pname = "lib-name";
  # TODO: Rename lib-name
  version = "v${lib-name-version.major}.${lib-name-version.minor}.${lib-name-version.patch}";
  src = ./.;
  meta = {
    # TODO: Update description
    description = "My library";
    owner = "xdeathofmojox";
  };
  nativeBuildInputs = [
    cmake
  ];
  outputs = [
    "out"
    "dev"
  ];

  cmakeFlags = [
    "-DPROJECT_NAME=${pname}"
    # TODO: Rename lib-name
    "-DPROJECT_VERSION=${lib-name-version.major}.${lib-name-version.minor}.${lib-name-version.patch}"
    "-DLIBRARY_NAME=${pname}"
    "-DBUILD_STATIC=${if static then "ON" else "OFF"}"
  ];
}