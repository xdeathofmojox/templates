final: prev: rec {
  # TODO: Rename lib-name
  lib-name-version = {
    major = "0";
    minor = "0";
    patch = "0";
  };
  # TODO: Rename lib-name
  lib-name = final.callPackage ./lib-name { };
  clang-tidy-check = final.callPackage ./nix/tools/clang-tidy.nix { };
  clang-tidy-fix = final.callPackage ./nix/tools/clang-tidy.nix { in_place = true; };
}
