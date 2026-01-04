{
  self,
  pkgs,
  ...
}: {
  imports = [
    ./hosts/nix-os/servers/minecraft-server/configuration.nix
    ./pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix
  ];

  u-pkg-essential-cli-tools.enable = true;

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config.allowUnfree = true;
  };
  environment.systemPackages = [
    self.packages.${pkgs.system}.nvimconf
  ];
}
