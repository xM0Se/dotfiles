{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];

  services.minecraft-servers = {
    enable = true;
    openFirewall = true;
    eula = true;
    dataDir = "/var/mini";
    servers.testttt = {
      enable = true;
      package = pkgs.vanillaServers.vanilla-1_21_11;
      autoStart = true;
      operators = {
        xMose = {
          uuid = "0a9b0753-9941-4861-ab0f-20a82e462ae9";
          level = 3;
          bypassesPlayerLimit = true;
        };
      };
      serverProperties = {
        white-list = true;
        gamemode = "survival";
        difficulty = "hard";
        simulation-distance = 20;
        spawn-protection = 0;
        hide-online-players = false;
        log-ips = true;
        force-gamemode = false;
        motd = "hope it works";
        server-port = 25565;
        view-distance = 20;
      };
      whitelist = {
        xMose = "0a9b0753-9941-4861-ab0f-20a82e462ae9";
        ElroKnight = "2beb73ed-3cf2-4a4b-a4ae-683db5b71dec";
        Mathehaeft = "62a27dc6-217f-4c30-b9e8-634f7df68044";
        Toaster0077282 = "82db6cf8-5a4f-43fe-95f3-486698fd910b";
      };
      symlinks = {
        "world/datapacks/afk display v1.1.15 (MC 1.21-1.21.11).zip" = "/var/datapacks/afk display v1.1.15 (MC 1.21-1.21.11).zip";
        "world/datapacks/anti enderman grief v1.1.15 (MC 1.21-1.21.11).zip" = "/var/datapacks/anti enderman grief v1.1.15 (MC 1.21-1.21.11).zip";
        "world/datapacks/armor statues v2.8.21 (MC 1.21-1.21.11).zip" = "/var/datapacks/armor statues v2.8.21 (MC 1.21-1.21.11).zip";
        "world/datapacks/coordinates hud v1.2.16 (MC 1.21-1.21.11).zip" = "/var/datapacks/coordinates hud v1.2.16 (MC 1.21-1.21.11).zip";
        "world/datapacks/custom nether portals v2.3.18 (MC 1.21-1.21.11).zip" = "/var/datapacks/custom nether portals v2.3.18 (MC 1.21-1.21.11).zip";
        "world/datapacks/durability ping v1.1.16 (MC 1.21-1.21.11).zip" = "/var/datapacks/durability ping v1.1.16 (MC 1.21-1.21.11).zip";
        "world/datapacks/Invisible item frame.zip" = "/var/datapacks/Invisible item frame.zip";
        "world/datapacks/mini blocks v1.1.5 (MC 1.21-1.21.11).zip" = "/var/datapacks/mini blocks v1.1.5 (MC 1.21-1.21.11).zip";
      };
    };
  };
}
