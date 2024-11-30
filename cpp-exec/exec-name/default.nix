{
  stdenv,
  cmake,
  # TODO: Rename exec-name
  exec-name-version,
}:

stdenv.mkDerivation rec {
  # TODO: Rename exec-name
  pname = "exec-name";
  # TODO: Rename exec-name
  version = "v${exec-name-version.major}.${exec-name-version.minor}.${exec-name-version.patch}";
  src = ./.;
  meta = {
    # TODO: Update description
    description = "My Executable";
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
    # TODO: Rename exec-name
    "-DPROJECT_VERSION=${exec-name-version.major}.${exec-name-version.minor}.${exec-name-version.patch}"
    "-DEXEC_NAME=${pname}"
  ];
}
