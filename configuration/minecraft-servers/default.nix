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
    dataDir = "/var/server-mach-was";
    servers.mach-was = {
      enable = true;
      autoStart = true;
      package = pkgs.fabricServers.fabric-26_1_2.override {jre_headless = pkgs.openjdk25_headless;}; # will be changed to pkgs.fabricServers when "https://github.com/Infinidoge/nix-minecraft/issues/211" gets resolved
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
        Itz_mikalli = "c50d4b30-2e56-4f03-84da-ce195fcefaee";
        Jari2k24 = "7bb0ef18-eb20-4a80-a3f8-8faf652307d9";
        Jonulinka = "5f0eacfc-6d33-4778-8ae9-37a738cd2cf2";
      };
      symlinks = {
        mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
          FabricApi = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/E1mjhYMF/fabric-api-0.150.0%2B26.1.2.jar";
            sha512 = "sha512-I4x5O3IO0h0tW1ZOyojHFM8hiPew+x/TCGRmD4CQHitNrSc5lLb3fePAqjZfkw7Yqsz/rEmzbGRWsVO1LV0h3A==";
          };
          Lithium = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/rzrH7czY/lithium-fabric-0.24.4%2Bmc26.1.2.jar";
            sha512 = "sha512-XUOWYJaLwG3upio7ds5G76aQfEYGAtbm1w/VB4oi9BrLyl0Rd+6Pc6NUpZyjmB8z7iDa/d/79B/wtL+/xle2yg==";
          };
          FerriteCore = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/uXXizFIs/versions/d5ddUdiB/ferritecore-9.0.0-fabric.jar";
            sha512 = "sha512-2B+pfhF4TBnUL4nC9DODHQB2A91xk87kX6F35KapxSs4SxmFhuBKD39jzZlv7XEzIleL3pqNtX4RiIVK5cvlhA==";
          };
          C2ME = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/VSNURh3q/versions/iFyIEVsG/c2me-fabric-mc26.1.2-0.3.7%2Balpha.0.69.jar";
            sha512 = "sha512-MuWiGRTs0WtFYNLVmkwalr6ShB1kLLJ4rNdkYcD+cOOHWUSRfLnlHaxxlCHXWr/9V7y6/m4pfnR36vNFFIV87Q==";
          };
          Krypton = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/kYAGItyj/krypton-0.3.0.jar";
            sha512 = "sha512-FCMyECg6dvPPQ1o7jdvL1lqFjSsaELiP9kPAoBSG39K/GEO9NFbNT7hsuzsG8t6gxOZjsZdqSOlt4W07WnB+yQ==";
          };
        });
      };
    };
  };
}
