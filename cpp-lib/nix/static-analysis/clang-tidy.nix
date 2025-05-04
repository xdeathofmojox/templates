{
  stdenv,
  clang-tools,
  cmake,
  src,
  ...
}:

stdenv.mkDerivation {
  name = "clang-tidy";
  inherit src;
  dontConfigure = true;

  nativeBuildInputs = [
    clang-tools
    cmake
  ];

  buildPhase = ''
    echo "Running clang tidy..."
    mkdir -p build
    pushd build
    cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    popd

    checks="-*,\
      google-*,\
      concurrency-*,\
      cppcoreguidelines-*,\
      modernize-*,\
      performance-*"

    find src \
        -name "*.cc" \
        -o -name "*.cpp" | \
    xargs clang-tidy \
        --checks="$checks" \
        --warnings-as-errors=* \
        -header-filter=include \
        --export-fixes=clang-tidy-fixes.yaml \
        -p build
  '';

  installPhase = ''
    mkdir -p $out/results
    if [ -f clang-tidy-fixes.yaml ]; then
      cp clang-tidy-fixes.yaml $out/results
    else
      echo "No clang-tidy-fixes.yaml file found."
    fi
  '';
}
