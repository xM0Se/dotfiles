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
    servers.the-new-kingdom = {
      enable = true;
      package = pkgs.fabricServers.fabric-1_21_11.override {
        loaderVersion = "0.18.4";
      };
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
        simulation-distance = 15;
        spawn-protection = 0;
        hide-online-players = false;
        log-ips = true;
        force-gamemode = false;
        motd = "The new Kingdom, a new era begins ... ";
        server-port = 25565;
        view-distance = 15;
      };
      whitelist = {
        xMose = "0a9b0753-9941-4861-ab0f-20a82e462ae9";
        ElroKnight = "2beb73ed-3cf2-4a4b-a4ae-683db5b71dec";
        Mathehaeft = "62a27dc6-217f-4c30-b9e8-634f7df68044";
        Toaster0077282 = "82db6cf8-5a4f-43fe-95f3-486698fd910b";
        P1Paxs = "9a3e9ef2-4fdd-4976-9a5c-6986fc7c3a62";
        Muecke1234 = "501c6362-50a6-4438-95e3-23e2e4e63de2";
      };
      symlinks = {
        mods = pkgs.linkFarmFromDrvs "mods" (
          builtins.attrValues {
            Fabric-API = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/9YVrKY0Z/fabric-api-0.115.0%2B1.21.1.jar";
              sha512 = "e5f3c3431b96b281300dd118ee523379ff6a774c0e864eab8d159af32e5425c915f8664b1cd576f20275e8baf995e016c5971fea7478c8cb0433a83663f2aea8";
            };
          }
        );
      };
    };
  };
}
