{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.aarch64-darwin.default = nixpkgs.legacyPackages.aarch64-darwin.buildEnv {
      name = "default";
      paths = with nixpkgs.legacyPackages.aarch64-darwin; [
        git
        curl
        go
        bottom
        gh
        mise
      ];
    };
  };
}
