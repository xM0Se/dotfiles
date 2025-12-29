{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix
  ];

  essential-cli-tools.enable = true;
  users.users.root.home = "/root";
  users.users.root.shell = pkgs.zsh;
  programs.zsh.enable = true;
  home-manager.backupFileExtension = "hm-backup";

  nixpkgs.hostPlatform = "x86_64-linux";
}
