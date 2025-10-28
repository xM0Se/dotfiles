{

    description = "xM0Se nix-darwin system flake";

    inputs = {

        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

        nix-darwin = {
            url = "github:nix-darwin/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs-unstable";
        };

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nvf = {
	        url = "github:notashelf/nvf";
	        inputs.nixpkgs.follows = "nixpkgs";
        };
   
        flake-parts.url = "github:hercules-ci/flake-parts";

    };

    outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nvf, nix-darwin, nix-homebrew, home-manager, flake-parts, ... }:
        flake-parts.lib.mkFlake { inherit inputs; } {
            flake = {
                darwinConfigurations."dMACOS" = nix-darwin.lib.darwinSystem {
                    specialArgs = { inherit inputs; };
                    modules = [
                        ./dMACOS.nix
                        home-manager.darwinModules.home-manager {
                            home-manager = {
                                useGlobalPkgs = true;
                                useUserPackages = true;
                                users.xm0se = { config, pkgs, ... }: import ./home-manager/home1.nix { inherit config pkgs inputs; };
                            };
                        }
                        nix-homebrew.darwinModules.nix-homebrew {
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
                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.users.root = ./home-manager/home2.nix;
                        }
                    ];
                };
            };

            systems = [
                "aarch64-darwin"
            ];     
        };
}
