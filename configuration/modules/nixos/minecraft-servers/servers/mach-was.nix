{
  pkgs,
  config,
  ...
}: {
  sops.secrets."minecraft/onedrive" = {
    owner = "minecraft";
    group = "minecraft";
    mode = "0400";
  };
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
      // (import ../modules/common/serverproperties.nix);

    whitelist = import ../modules/common/whitelist.nix;

    # operators = import ../modules/common/operators.nix;

    symlinks =
      {
        "plugins/TeaksTweaks/config.yml" = pkgs.writeTextFile {
          name = "config.yml";
          text = builtins.readFile ../plugins/purpur/config/teaks-tweaks.yml;
        };
        "plugins/DriveBackupV2/config.yml" = pkgs.writeTextFile {
          name = "config.yml";
          text = builtins.readFile ../plugins/purpur/config/drivebackupv2.yml;
        };
        configFile = config.sops.secrets."minecraft/onedrive".path;
      }
      // (import ../plugins/purpur/teaks-tweaks.nix {inherit pkgs;})
      // (import ../plugins/paper/chunky.nix {inherit pkgs;})
      // (import ../plugins/purpur/drivebackupv2.nix {inherit pkgs;})
      // (import ../plugins/paper/luckperms.nix {inherit pkgs;});

    files = import ../modules/purpur/config.nix {inherit pkgs;};
  };
}
