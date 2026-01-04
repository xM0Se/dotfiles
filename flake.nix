{
  description = "xM0Se nix-darwin system flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

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
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nvf,
    nix-darwin,
    nix-homebrew,
    home-manager,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs self;} {
      flake = {
        darwinConfigurations."dMACOS" = nix-darwin.lib.darwinSystem {
          specialArgs = {inherit inputs self;};
          modules = [
            ./dMACOS.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = {inherit inputs self;};
                users.xm0se = {
                  config,
                  pkgs,
                  ...
                }:
                  import ./home-manager/home1.nix {inherit config pkgs inputs self;};
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

        nixosConfigurations."test" = nixpkgs.lib.nixosSystem {
          modules = [
            ./test.nix
            ./hosts/nix-os/servers/test1/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.root = ./home-manager/home2.nix;
            }
          ];
        };
      };

  #minecraft-server = input.nixpkgs.lib.nixosSystem {
   # system = "x86_64-linux";  # or set nixpkgs.hostPlatform in a module.
    #modules = [
     # ./hosts/nix-os/servers/minecraft-server.nix
#    ];
 # };
        nixosConfigurations."minecraft-server" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/nix-os/servers/minecraft-server.nix ];
        };


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
                ./home-manager/nvim/testy.nix
              ];
            }).neovim;
        };
      };
    };
}
