{
  inputs = {
    geph4-src = {
      flake = false;
      url = github:geph-official/geph4-client;
    };
    nixpkgs.url = github:nixos/nixpkgs;
  };

  outputs = { self, geph4-src, nixpkgs, ... }: let
    pkgs = import nixpkgs {
      localSystem = {
        #gcc.arch = "ivybridge";
        #gcc.tune = "ivybridge";
        system = "x86_64-linux";
      };
    };
    in {
    packages."x86_64-linux".default = pkgs.rustPlatform.buildRustPackage {
      name = "geph4-client";
      src = geph4-src;
      cargoLock = { lockFile = "${geph4-src}/Cargo.lock"; };
    };   
  };
}
