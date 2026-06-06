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

    flake-parts.url = "github:hercules-ci/flake-parts";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = inputs @ {
    self,
    nixpkgs-stable,
    nixpkgs,
    nvf,
    sops-nix,
    nix-darwin,
    nix-homebrew,
    home-manager,
    flake-parts,
    nix-minecraft,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs self;} {
      systems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];
      perSystem = {pkgs, ...}: {
        config = {
          packages.nvimconf =
            (nvf.lib.neovimConfiguration {
              pkgs = pkgs;
              modules = [
                ./pkgs/custom/nvim/testy.nix
              ];
            }).neovim;
        };
      };

      flake = {
        darwinConfigurations."dMACOS" = nix-darwin.lib.darwinSystem {
          specialArgs = {inherit inputs self;};
          modules = [
            ./hosts/darwin/dMACOS.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {inherit inputs self;};
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.xm0se = ./home/configurations/darwin.nix;
              };
            }
          ];
        };
        nixosConfigurations.minecraft-server = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs self;};
          modules = [
            ./hosts/servers/minecraft-server/config.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {inherit inputs self;};
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.xm0se = ./home/configurations/server.nix;
              };
            }
          ];
        };
      };
    };
}
