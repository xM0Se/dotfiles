{
  pkgs,
  config,
  self,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./deploy.nix
    (self + "/pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix")
    (self + "/configuration/modules/nixos/minecraft-servers/default.nix")
    (self + "/configuration/configurations/server.nix")
  ];

  essential-cli-tools.enable = true;
  home-manager.users = {
    moritz = "${self}/home/configurations/server.nix";
  };

  networking = {
    hostName = "nixos";
    firewall.enable = true;
  };

  time.timeZone = "Europe/Berlin";

  sops.secrets = {
    "userPasswords/nixServer/moritz".neededForUsers = true;
    "userPasswords/nixServer/root".neededForUsers = true;
  };
  users.mutableUsers = false;
  users.users = {
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

  services.xserver.xkb.layout = "us";

  virtualisation.docker.enable = true;

  environment.systemPackages = [
    pkgs.vim
    pkgs.sops
    pkgs.git
    pkgs.wget
  ];

  system.stateVersion = "25.05";
}
