{pkgs, ...}: {
  services.minecraft-servers.servers.fabric = {
    enable = true;
    autoStart = true;
    enableReload = true;
    package = pkgs.fabricServers.fabric-26_1_2.override {jre_headless = pkgs.openjdk25_headless;};
    serverProperties =
      {
        motd = "fabric template server";
        # level-seed = <seed>;
        server-port = 25565;
      }
      // (import ../modules/common/serverproperties.nix);

    whitelist = import ../modules/common/whitelist.nix;

    symlinks = import ../mods/fabric/PerformanceMods.nix;
  };
}
