{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager} @inputs: let 
    system = "aarch64-darwin";
  in {
    packages.${system}.default = nixpkgs.legacyPackages.${system}.buildEnv {
      name = "default";
      paths = with nixpkgs.legacyPackages.${system}; [
        git
        curl
        go
        bottom
        gh
        mise
      ];
    };
    homeConfigurations = {
      myHomeConfig = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = system;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
