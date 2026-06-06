{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../../pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix
    ../../../configuration/modules/nixos/minecraft-servers/default.nix
    ../../../configuration/configurations/server.nix
  ];

  essential-cli-tools.enable = true;

  networking = {
    hostName = "nixos";
    firewall.enable = false;
  };

  time.timeZone = "Europe/Berlin";

  sops.secrets."userPasswords/nixServer/xm0se".neededForUsers = true;

  users.users = {
    xm0se = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      home = "/xm0se";
      password = config.sops.secrets."userPasswords/nixServer/xm0se".path;
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJBl1kqPOoIsYob5yTncLgTFqB5MgLl+2lnAe4hEoYpL nix-server"];
    };
    root.home = "/root";
  };

  services.xserver.xkb.layout = "us";

  virtualisation.docker.enable = true;

  environment.systemPackages = [
    pkgs.vim
    pkgs.sops
    pkgs.git
    pkgs.wget
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.05";
}
