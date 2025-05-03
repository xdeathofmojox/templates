final: prev: rec {
  workspace-name = final.rustPlatform.buildRustPackage {
    pname = (final.lib.importTOML ./Cargo.toml).workspace.name;
    version = (final.lib.importTOML ./Cargo.toml).workspace.version;
    src = ./.;
    cargoLock.lockFile = ./Cargo.lock;
  };
  exec-name = final.rustPlatform.buildRustPackage rec {
    pname = (final.lib.importTOML ./crates/exec_name/Cargo.toml).package.name;
    version = (final.lib.importTOML ./crates/exec_name/Cargo.toml).package.version;
    src = ./.;
    cargoLock.lockFile = ./Cargo.lock;
    buildAndTestSubdir = "./crates/exec_name";
  };
  lib-name = final.rustPlatform.buildRustPackage {
    pname = (final.lib.importTOML ./crates/lib_name/Cargo.toml).package.name;
    version = (final.lib.importTOML ./crates/lib_name/Cargo.toml).package.version;
    src = ./.;
    cargoLock.lockFile = ./Cargo.lock;
    buildAndTestSubdir = "./crates/lib_name";
    useNextest = true;
  };
}
