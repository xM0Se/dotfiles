{
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
}
