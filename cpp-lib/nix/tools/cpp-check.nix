{
  pkgs,
}:

pkgs.writeShellApplication {
  name = "cpp-check";
  runtimeInputs = [
    pkgs.cppcheck
  ];
  text = ''
    set -e

    echo "Running cppcheck..."
    WORK_DIR=$(pwd)
    RESULT_DIR="$WORK_DIR/cpp-check-results"

    mkdir -p "$RESULT_DIR"
    cppcheck \
      --enable=all \
      --suppress=missingIncludeSystem \
      --suppress=unmatchedSuppression \
      --xml \
      --output-file="$RESULT_DIR/cppcheck_report.xml" \
      --inconclusive \
      --std=c++20 \
      -I "$WORK_DIR/include" \
      "$WORK_DIR/src"
    cppcheck-htmlreport \
      --file="$RESULT_DIR/cppcheck_report.xml" \
      --report-dir="$RESULT_DIR/html_report" \
      --source-dir="$WORK_DIR"

    error_count=$(xmllint --xpath 'count(/results/errors/error[not(@severity="information")])' "$RESULT_DIR/cppcheck_report.xml")

    if (( error_count > 0 )); then
      echo "Cppcheck found $error_count issues"
      exit 1
    else
      echo "Cppcheck found no issues"
      exit 0
    fi
  '';
}
