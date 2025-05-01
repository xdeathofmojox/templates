final: prev: rec {
  # TODO: Rename lib-name
  lib-name-version = {
    major = "0";
    minor = "0";
    patch = "0";
  };
  # TODO: Rename lib-name
  lib-name = final.callPackage ./lib-name { };
  # TODO: Rename lib-name
  lib-name-static = lib-name.override { static = true; };
}
