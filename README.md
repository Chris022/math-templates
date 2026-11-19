# math-templates

Typst templates specifically made for writing math.

# Installation

## General

To install a specific version simply use the provided installation script `install.sh`.

## Nix

For Nix there is a package in `./nix/package.nix`. You can include it in you configuration via:

```nix
{
  pkgs,
  ...
}:
let
  math-templates = pkgs.callPackage ./path/to/package.nix { };
in
{
    environment.systemPackages = with pkgs; [
        (pkgs.typst.withPackages (p: [
            math-templates
        ]))
    ];
}
```

# Usage

If you installed via `install.sh` import it as:

```typst
#import "@local/math-templates:1.0.0"
```

if you used the Nix package:

```typst
#import "@preview/math-templates:1.0.0"
```
