#!/usr/bin/env bash
set -e

nix develop --command bash -c '
cmake -B build -S .
cmake --build build

checks="-*,\
google-*,\
concurrency-*,\
cppcoreguidelines-*,\
modernize-*,\
performance-*,"

find ./src \
    -name "*.cc" \
    -o -name "*.cpp" | \
xargs clang-tidy \
    --checks=$checks \
    --warnings-as-errors=* \
    -header-filter=-* \
    --export-fixes=clang-tidy-fixes.yaml \
    -p build
'