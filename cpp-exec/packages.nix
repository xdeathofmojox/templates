{ pkgs, ... }:
{
  # TODO: Rename exec-name
  default = pkgs.exec-name;
  # TODO: Rename exec-name
  exec-name = pkgs.exec-name;
  # TODO: Rename exec-name
  exec-name-cpp-check = pkgs.callPackage ./nix/static-analysis/cpp-check.nix {
    src = pkgs.exec-name.src;
  };
  # TODO: Rename exec-name
  exec-name-clang-tidy = pkgs.callPackage ./nix/static-analysis/clang-tidy.nix {
    src = pkgs.exec-name.src;
  };
}
