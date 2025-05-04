{
  lib,
  stdenv,
  cmake,
  gtest,
  debug ? false,
  asan ? false,
  msan ? false,
  tsan ? false,
  ubsan ? false,
  # TODO: Rename lib-name
  lib-name,
  # TODO: Rename lib-name
  lib-name-version,
}:

stdenv.mkDerivation rec {
  # TODO: Rename lib-name
  pname = "lib-name-unit-tests";
  # TODO: Rename lib-name
  version = "v${lib-name-version.major}.${lib-name-version.minor}.${lib-name-version.patch}";
  src = ./.;
  meta = {
    # TODO: Update description
    description = "My library unit tests";
    owner = "xdeathofmojox";
  };
  buildInputs = [
    cmake
    gtest
    # TODO: Rename lib-name
    lib-name
  ];

  cmakeFlags = [
    "-DPROJECT_NAME=${pname}"
    # TODO: Rename lib-name
    "-DPROJECT_VERSION=${lib-name-version.major}.${lib-name-version.minor}.${lib-name-version.patch}"
    "-DTARGET_NAME=${pname}"
    "-DCMAKE_BUILD_TYPE=${if debug then "Debug" else "Release"}"
  ] ++ lib.optional asan "-DENABLE_ASAN=ON"
    ++ lib.optional msan "-DENABLE_MSAN=ON"
    ++ lib.optional tsan "-DENABLE_TSAN=ON"
    ++ lib.optional ubsan "-DENABLE_UBSAN=ON";

  # Needed for proper sanitizer behavior
  hardeningDisable = lib.optionals (debug && (asan || msan || tsan || ubsan)) [ "fortify" "pic" ];

  outputs = [ "out" ];
}
