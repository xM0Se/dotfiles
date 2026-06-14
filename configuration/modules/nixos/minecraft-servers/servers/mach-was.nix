{pkgs, ...}: {
  services.minecraft-servers.servers.mach-was = {
    enable = true;
    autoStart = true;
    enableReload = true;
    package = pkgs.purpurServers.purpur-26_1_2;
    serverProperties =
      {
        motd = "Mach was !";
        level-seed = 3791842102387187656;
        server-port = 25565;
      }
      // (import ../modules/serverproperties.nix);

    whitelist = import ../modules/whitelist.nix;

    operators = import ../modules/operators.nix;

    symlinks =
      {
        "plugins/TeaksTweaks/config.yml" = pkgs.writeTextFile {
          name = "config.yml";
          text = builtins.readFile ../plugins/purpur/config/teaks-tweaks.yml;
        };
      }
      // (import ../plugins/purpur/plugins.nix {inherit pkgs;})
      // (import ../plugins/paper/plugins.nix {inherit pkgs;});
    files = {
      "config/paper-world-defaults.yml" = pkgs.writeTextFile {
        name = "paper-world-defaults.yml";
        text = builtins.readFile ../config/purpur/paper/paper-world-defaults.yml;
      };
      "config/paper-global.yml" = pkgs.writeTextFile {
        name = "paper-global.yml";
        text = builtins.readFile ../config/purpur/paper/paper-global.yml;
      };
      "purpur.yml" = pkgs.writeTextFile {
        name = "purpur.yml";
        text = builtins.readFile ../config/purpur/purpur.yml;
      };
      "spigot.yml" = pkgs.writeTextFile {
        name = "spigot.yml";
        text = builtins.readFile ../config/purpur/spigot.yml;
      };
      "bukkit.yml" = pkgs.writeTextFile {
        name = "bukkit.yml";
        text = builtins.readFile ../config/purpur/bukkit.yml;
      };
    };
  };
}
