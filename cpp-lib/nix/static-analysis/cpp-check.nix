{
  stdenv,
  cppcheck,
  src,
  ...
}:

stdenv.mkDerivation {
  name = "cpp-check";
  inherit src;

  nativeBuildInputs = [ cppcheck ];

  buildPhase = ''
    echo "Running cppcheck..."
    cppcheck \
      --enable=all \
      --suppress=missingIncludeSystem \
      --suppress=unmatchedSuppression \
      --xml \
      --output-file=cppcheck_report.xml \
      --inconclusive \
      --std=c++20 \
      -I include \
      src
    cppcheck-htmlreport --file=cppcheck_report.xml --report-dir=html_report --source-dir=.
  '';

  installPhase = ''
    mkdir -p $out/results
    cp cppcheck_report.xml $out/results
    cp -r html_report $out/results
  '';
}
