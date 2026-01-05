{
  self,
  pkgs,
  ...
}: {
  imports = [
    ./hosts/nix-os/servers/minecraft-server/configuration.nix
    ./pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix
    ./configuration/minecraft-servers/default.nix
  ];

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
    self.packages.${pkgs.system}.nvimconf
  ];
}
