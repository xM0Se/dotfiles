{
  description = "xM0Se NIX Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    colmena.url = "github:zhaofengli/colmena";

    disko.url = "github:nix-community/disko";

    nixos-raspberrypi = {
      url = "github:nvmd/nixos-raspberrypi/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nvf,
    nix-darwin,
    flake-parts,
    colmena,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs self;} {
      systems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];
      perSystem = {pkgs, ...}: {
        packages.nvimconf =
          (nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [./pkgs/custom/nvim/testy.nix];
          }).neovim;
      };

      flake = {
        colmenaHive = colmena.lib.makeHive {
          meta = {
            nixpkgs = import nixpkgs {
              system = "x86_64-linux";
            };
            specialArgs = {inherit inputs self;};
          };
          minecraft-server = import ./hosts/servers/minecraft-server/deploy.nix;
        };

        darwinConfigurations."dMACOS" = nix-darwin.lib.darwinSystem {
          specialArgs = {inherit inputs self;};
          modules = [
            ./hosts/darwin/dMACOS.nix
          ];
        };
        nixosConfigurations.minecraft-server = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs self;};
          modules = [
            ./hosts/servers/minecraft-server/config.nix
          ];
        };
      };
    };
}
