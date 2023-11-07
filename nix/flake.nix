{
  description = "Cylcomed cluster OS & tools.";

  inputs = {
    nixpkgs-unstable.url = "github:NixOs/nixpkgs/645ff62e09d294a30de823cb568e9c6d68e92606";
                                               # ^ nixos-unstable branch on 01 Jul 2023.
    teadal.url = "github:c0c0n3/teadal.proto?dir=nix";
    nixie.url = "github:c0c0n3/nixie";
  };

  outputs = { self, nixpkgs-unstable, nixie, teadal }:
  let
    inputPkgs = nixpkgs-unstable // {
      mkOverlays = system: [ teadal.overlay ];
    };
    build = nixie.lib.flakes.mkOutputSetForCoreSystems inputPkgs;
    pkgs = build (import ./pkgs/mkSysOutput.nix);
  in
    pkgs;
}
