{
  lib,
  stdenv,
  cmake,
  debug ? false,
  asan ? false,
  msan ? false,
  tsan ? false,
  ubsan ? false,
  # TODO: Rename exec-name
  exec-name-version,
}:

stdenv.mkDerivation (finalAttrs: {
  # TODO: Rename exec-name
  pname = "exec-name";
  # TODO: Rename exec-name
  version = "${exec-name-version.major}.${exec-name-version.minor}.${exec-name-version.patch}";
  src = ./.;
  meta = {
    # TODO: Update description
    description = "My executable";
    owner = "xdeathofmojox";
  };
  nativeBuildInputs = [
    cmake
  ];

  cmakeFlags = [
    "-DPROJECT_NAME=${finalAttrs.pname}"
    "-DPROJECT_VERSION=${finalAttrs.version}"
    "-DTARGET_NAME=${finalAttrs.pname}"
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
})
