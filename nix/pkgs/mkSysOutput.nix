#
# Function to generate the Flake output for a given system.
#
{ # System label---e.g. "x86_64-linux", "x86_64-darwin", etc.
  system,
  # The Nix package set for the input system, possibly with
  # overlays from other Flakes bolted on.
  sysPkgs,
  ...
}:
{
  defaultPackage.${system} = sysPkgs.teadal.cli-tools-dev-shell;    # (1)
}
# NOTE
# 1. Dev shell. This package comes from `github.com/c0c0n3/teadal.proto`.
# Since we're using the exact same dev tools, it's pointless to duplicate
# code.
