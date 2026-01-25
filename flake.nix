{
  description = "xM0Se nix-darwin system flake";

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
      url = "github:notashelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
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
        darwinConfigurations."dMACOS" = let
          system = "x86_64-linux";
          pkgs-stable = self.lib.mkpkgs {
            nixpkgs = inputs.nixpkgs-stable;
            inherit system;
          };
        in
          nix-darwin.lib.darwinSystem {
            specialArgs = {inherit inputs pkgs-stable self;};
            modules = [
              ./hosts/darwin/dMACOS.nix
              sops-nix.darwinModules.sops
              home-manager.darwinModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  backupFileExtension = "backup";
                  extraSpecialArgs = {inherit inputs pkgs-stable self;};
                  users.xm0se = {
                    config,
                    pkgs,
                    ...
                  }:
                    import ./home/configurations/home1.nix {inherit config pkgs pkgs-stable inputs self;};
                };
              }
              nix-homebrew.darwinModules.nix-homebrew
              {
                nix-homebrew = {
                  enable = true;
                  enableRosetta = true;
                  user = "xm0se";
                };
              }
            ];
          };
        nixosConfigurations."minecraft-server" = let
          system = "x86_64-linux";
          pkgs-stable = self.lib.mkpkgs {
            nixpkgs = inputs.nixpkgs-stable;
            inherit system;
          };
        in
          nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs pkgs-stable self;};
            system = "x86_64-linux";
            modules = [
              ./hosts/nix-os/servers/minecraft-server/config.nix
              sops-nix.nixosModules.sops
              nix-minecraft.nixosModules.minecraft-servers
              {
                nixpkgs.overlays = [inputs.nix-minecraft.overlay];
              }
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  backupFileExtension = "backup";
                  extraSpecialArgs = {inherit inputs pkgs-stable self;};
                  users.root = {
                    config,
                    pkgs,
                    ...
                  }:
                    import ./home/configurations/home3.nix {inherit config pkgs inputs pkgs-stable self;};
                };
              }
            ];
          };
      };
    };
}
