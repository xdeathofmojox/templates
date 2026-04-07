# templates

Nix flake templates for C, C++, Rust, and Zig projects.

## Usage

Initialize a template in a new directory:

```sh
nix flake init -t github:xdeathofmojox/templates#<template-name>
```

Or list available templates:

```sh
nix flake show github:xdeathofmojox/templates
```

## Templates

| Template | Description |
|---|---|
| `c-exec` | C executable with Nix dev environment |
| `c-lib` | C library with Nix dev environment |
| `cpp-exec` | C++ executable with Nix dev environment |
| `cpp-exec-addition` | C++ executable to add into an existing project |
| `cpp-lib` | C++ library with Nix dev environment (default) |
| `cpp-lib-addition` | C++ library to add into an existing project |
| `rust-cargo-crate` | Single Rust crate with Nix dev environment |
| `rust-cargo-workspace` | Rust Cargo workspace with Nix dev environment |
| `zig-exec` | Zig executable with Nix dev environment |
| `zig-lib` | Zig library with Nix dev environment |

## Structure

All templates use [flake-parts](https://github.com/hercules-ci/flake-parts) and [import-tree](https://github.com/vic/import-tree) to organize Nix modules under `nix/modules/`. Formatting is handled by [treefmt-nix](https://github.com/numtide/treefmt-nix).

Rust templates additionally use [fenix](https://github.com/nix-community/fenix) for the Rust toolchain and [crane](https://github.com/ipetkov/crane) for building.

After initializing a template, search for `TODO` comments to find places that need to be renamed or customized for your project.
