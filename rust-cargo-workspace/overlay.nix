final: prev: rec {
  workspace-name = final.rustPlatform.buildRustPackage {
    pname = (final.lib.importTOML ./Cargo.toml).workspace.metadata.crane.name;
    version = (final.lib.importTOML ./Cargo.toml).workspace.package.version;
    src = ./.;
    cargoLock.lockFile = ./Cargo.lock;
  };
  exec-name = final.rustPlatform.buildRustPackage rec {
    pname = (final.lib.importTOML ./crates/exec-name/Cargo.toml).package.name;
    version = (final.lib.importTOML ./crates/exec-name/Cargo.toml).package.version;
    src = ./.;
    cargoLock.lockFile = ./Cargo.lock;
    buildAndTestSubdir = "./crates/exec-name";
  };
  lib-name = final.rustPlatform.buildRustPackage {
    pname = (final.lib.importTOML ./crates/lib-name/Cargo.toml).package.name;
    version = (final.lib.importTOML ./crates/lib-name/Cargo.toml).package.version;
    src = ./.;
    cargoLock.lockFile = ./Cargo.lock;
    buildAndTestSubdir = "./crates/lib-name";
    useNextest = true;
  };
}
