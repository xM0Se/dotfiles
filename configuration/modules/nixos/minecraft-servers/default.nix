{inputs, ...}: {
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
    ./servers/mach-was.nix
  ];
  nixpkgs.overlays = [inputs.nix-minecraft.overlay];

  services.minecraft-servers = {
    enable = true;
    openFirewall = true;
    eula = true;
    dataDir = "/var/minecraft-servers";
  };
}
