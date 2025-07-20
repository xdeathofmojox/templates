{
  lib,
  stdenv,
  cmake,
  static ? false,
  debug ? false,
  asan ? false,
  msan ? false,
  tsan ? false,
  ubsan ? false,
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
    description = "My library";
    owner = "xdeathofmojox";
  };
  nativeBuildInputs = [
    cmake
  ];
  outputs = [
    "out"
  ];

  cmakeFlags =
    [
      "-DPROJECT_NAME=${project-name}"
      # TODO: Rename lib-name
      "-DPROJECT_VERSION=${lib-name-version.major}.${lib-name-version.minor}.${lib-name-version.patch}"
      "-DTARGET_NAME=${project-name}"
      "-DBUILD_STATIC=${if static then "ON" else "OFF"}"
      "-DCMAKE_BUILD_TYPE=${if debug then "Debug" else "Release"}"
    ]
    ++ lib.optional asan "-DENABLE_ASAN=ON"
    ++ lib.optional msan "-DENABLE_MSAN=ON"
    ++ lib.optional tsan "-DENABLE_TSAN=ON"
    ++ lib.optional ubsan "-DENABLE_UBSAN=ON";

  # Needed for proper sanitizer behavior
  hardeningDisable = lib.optionals (debug && (asan || msan || tsan || ubsan)) [
    "fortify"
    "pic"
  ];
}
