{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../../pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix
    ../../../configuration/modules/nixos/minecraft-servers/default.nix
  ];

  essential-cli-tools.enable = true;

  networking = {
    hostName = "nixos";
    firewall.enable = false;
  };

  time.timeZone = "Europe/Berlin";

  users.users = {
    xm0se = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      home = "/xm0se";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJBl1kqPOoIsYob5yTncLgTFqB5MgLl+2lnAe4hEoYpL nix-server"
      ];
    };
    root.home = "/root";
  };

  services = {
    xserver.xkb.layout = "us";
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "yes";
      };
    };
  };

  virtualisation.docker.enable = true;

  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.wget
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.05";
}
