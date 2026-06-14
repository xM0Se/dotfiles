{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];
  nixpkgs.overlays = [inputs.nix-minecraft.overlay];

  environment.systemPackages = [
    pkgs.packwiz
  ];
  services.minecraft-servers = {
    enable = true;
    openFirewall = true;
    eula = true;
    dataDir = "/var/minecraft-servers";
    servers.mach-was = {
      enable = true;
      autoStart = true;
      enableReload = true;
      package = pkgs.purpurServers.purpur-26_1_2;
      serverProperties = {
        sync-chunk-writes = false;
        white-list = true;
        gamemode = "survival";
        difficulty = "hard";
        simulation-distance = 6;
        spawn-protection = 0;
        hide-online-players = false;
        log-ips = true;
        force-gamemode = false;
        motd = "Mach was !";
        level-seed = 3791842102387187656;
        server-port = 25565;
        view-distance = 15;
      };
      whitelist = import ./whitelist.nix;
      symlinks =
        {
          "plugins/TeaksTweaks/config.yml" = pkgs.writeTextFile {
            name = "config.yml";
            text = builtins.readFile ./teaks-tweaks.yml;
          };
          "purpur.yml" = pkgs.writeTextFile {
            name = "purpur.yml";
            text = builtins.readFile ./purpur.yml;
          };
          "bukkit.yml" = pkgs.writeTextFile {
            name = "bukkit.yml";
            text = builtins.readFile ./bukkit.yml;
          };
          "config/paper-global.yml" = pkgs.writeTextFile {
            name = "paper-global.yml";
            text = builtins.readFile ./paper-global.yml;
          };
          "config/paper-world-defaults.yml" = pkgs.writeTextFile {
            name = "paper-world-defaults.yml";
            text = builtins.readFile ./paper-world-defaults.yml;
          };
          "spigot.yml" = pkgs.writeTextFile {
            name = "spigot.yml";
            text = builtins.readFile ./spigot.yml;
          };
        }
        // (import ./plugins.nix {inherit pkgs;});
    };
  };
}
