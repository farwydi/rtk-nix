# rtk-nix

NixOS package for [rtk](https://github.com/rtk-ai/rtk) — high-performance CLI proxy to minimize LLM token consumption.

Uses pre-built binaries from GitHub releases.

## Usage

### Standalone

```bash
nix-build -E 'with import <nixpkgs> {}; callPackage ./package.nix {}'
./result/bin/rtk --version
```

### Home Manager

```nix
let
  rtk = pkgs.callPackage /path/to/rtk-nix/package.nix {};
in {
  home.packages = [ rtk ];
}
```

### Flake

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rtk-nix.url = "github:farwydi/rtk-nix";
  };

  outputs = { nixpkgs, rtk-nix, ... }: {
    # use rtk-nix.packages.x86_64-linux.default
  };
}
```

## Update

```bash
./update.sh          # latest release
./update.sh v0.40.0  # specific version
```
