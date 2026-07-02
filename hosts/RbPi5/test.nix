{
  self,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    (self + "/pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix")
    (self + "/configuration/modules/nixos/minecraft-servers/default.nix")
    (self + "/configuration/configurations/server.nix")
  ];

  essential-cli-tools.enable = true;
  home-manager.users = {
    moritz = {
      imports = [
        (self + "/home/configurations/server.nix")
        (self + "/home/users/moritz.nix")
      ];
    };
    root = {
      imports = [
        (self + "/home/configurations/server.nix")
        (self + "/home/users/root.nix")
      ];
    };
  };
  networking = {
    wireless = {
      enable = false;
      iwd = {
        enable = true;
        settings = {
          Network = {
            EnableIPv6 = true;
            RoutePriorityOffset = 300;
          };
          Settings.AutoConnect = true;
        };
      };
    };
    hostName = "RbPi5";
    firewall.enable = true;
  };

  time.timeZone = "Europe/Berlin";

  sops.secrets = {
    "userPasswords/nixServer/moritz".neededForUsers = true;
    "userPasswords/nixServer/root".neededForUsers = true;
  };
  users = {
    mutableUsers = false;
    users = {
      moritz = {
        isNormalUser = true;
        extraGroups = ["wheel"];
        home = "/moritz";
        hashedPasswordFile = config.sops.secrets."userPasswords/nixServer/moritz".path;
        openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJBl1kqPOoIsYob5yTncLgTFqB5MgLl+2lnAe4hEoYpL nix-server"];
      };
      deploy = {
        isNormalUser = true;
        extraGroups = ["wheel"];
        hashedPassword = "!";
        openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIALKJQ+LNa7PhF38vRiBFXU6YHEiHyb9h3EnBfneUTel nix-server-deploy"];
      };
      root = {
        home = "/root";
        hashedPasswordFile = config.sops.secrets."userPasswords/nixServer/root".path;
      };
    };
  };

  services.xserver.xkb.layout = "us";
  security.sudo.extraRules = [
    {
      users = ["deploy"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  virtualisation.docker.enable = true;

  environment.systemPackages = [
    pkgs.vim
    pkgs.sops
    pkgs.git
    pkgs.wget
  ];

  system.stateVersion = "25.05";
}
