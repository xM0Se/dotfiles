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
    dataDir = "/var/server-mini";
    servers.the-new-kingdom-fabric = {
      enable = true;
      autoStart = true;
      package = pkgs.fabricServers.fabric-1_21_11;
      operators = {
        xMose = {
          uuid = "0a9b0753-9941-4861-ab0f-20a82e462ae9";
          level = 3;
          bypassesPlayerLimit = true;
        };
      };
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
        motd = "The new Kingdom, i hope this works ... ";
        server-port = 25566;
        view-distance = 9;
      };
      whitelist = {
        xMose = "0a9b0753-9941-4861-ab0f-20a82e462ae9";
        ElroKnight = "2beb73ed-3cf2-4a4b-a4ae-683db5b71dec";
        #        Mathehaeft = "62a27dc6-217f-4c30-b9e8-634f7df68044";
        #        Toaster0077282 = "82db6cf8-5a4f-43fe-95f3-486698fd910b";
        #        P1Paxs = "9a3e9ef2-4fdd-4976-9a5c-6986fc7c3a62";
        #        Muecke1234 = "501c6362-50a6-4438-95e3-23e2e4e63de2";
        #        GAMERSBLADE5668 = "06264d01-5235-4c5c-8516-a34457b7b723";
      };
    };
    servers.the-new-kingdom = {
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
        sync-chunk-writes = false;
        white-list = true;
        gamemode = "survival";
        difficulty = "hard";
        simulation-distance = 6;
        spawn-protection = 0;
        hide-online-players = false;
        log-ips = true;
        force-gamemode = false;
        motd = "The new Kingdom, a new era begins ... ";
        server-port = 25565;
        view-distance = 9;
      };
      whitelist = {
        xMose = "0a9b0753-9941-4861-ab0f-20a82e462ae9";
        ElroKnight = "2beb73ed-3cf2-4a4b-a4ae-683db5b71dec";
        Mathehaeft = "62a27dc6-217f-4c30-b9e8-634f7df68044";
        Toaster0077282 = "82db6cf8-5a4f-43fe-95f3-486698fd910b";
        P1Paxs = "9a3e9ef2-4fdd-4976-9a5c-6986fc7c3a62";
        Muecke1234 = "501c6362-50a6-4438-95e3-23e2e4e63de2";
        GAMERSBLADE5668 = "06264d01-5235-4c5c-8516-a34457b7b723";
      };
    };
  };
}
