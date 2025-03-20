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
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.buildEnv {
      name = "default";
      paths = with pkgs; [
        git
        curl
        go
        bottom
        gh
        mise
      ];
    };
    formatter.${system} = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    homeConfigurations = {
      homeConfig = home-manager.lib.homeManagerConfiguration {
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
