#!/usr/bin/env bash
set -e

nix develop --command bash -c '
find ./include -name "*.h" -o -name "*.hpp" | xargs clang-format --style=google --verbose -i
find ./src -name "*.cc" -o -name "*.cpp"    | xargs clang-format --style=google --verbose -i
'