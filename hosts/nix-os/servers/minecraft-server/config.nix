{
  config,
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix
    ./configuration/minecraft-servers/default.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos";

  time.timeZone = "Europe/Amsterdam";

  services.xserver.xkb.layout = "us";

  users.users.xm0se = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      tree
      git
    ];
  };

  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;
  services.openssh.settings.PermitRootLogin = "yes";

  networking.firewall.enable = false;

  essential-cli-tools.enable = true;
  programs.zsh.enable = true;
  users.users.root = {
    home = "/root";
    shell = pkgs.zsh;
  };
  virtualisation.docker.enable = true;
  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config.allowUnfree = true;
  };
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.wget
    pkgs.jdk25_headless
    self.packages.${pkgs.stdenv.hostPlatform.system}.nvimconf
  ];
  system.stateVersion = "25.05";
}
