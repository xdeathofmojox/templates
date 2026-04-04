final: prev: {
  # TODO: Update crate-name
  crate-name = final.rustPlatform.buildRustPackage {
    pname = (final.lib.importTOML ./Cargo.toml).package.name;
    version = (final.lib.importTOML ./Cargo.toml).package.version;
    src = ./.;
    cargoLock.lockFile = ./Cargo.lock;
  };
}
