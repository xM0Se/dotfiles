{pkgs, ...}: {
  "config/paper-world-defaults.yml" = pkgs.writeTextFile {
    name = "paper-world-defaults.yml";
    text = builtins.readFile ../paper/config/paper-world-defaults.yml;
  };
  "config/paper-global.yml" = pkgs.writeTextFile {
    name = "paper-global.yml";
    text = builtins.readFile ../paper/config/paper-global.yml;
  };
  "purpur.yml" = pkgs.writeTextFile {
    name = "purpur.yml";
    text = builtins.readFile ./config/purpur.yml;
  };
  "spigot.yml" = pkgs.writeTextFile {
    name = "spigot.yml";
    text = builtins.readFile ./config/spigot.yml;
  };
  "bukkit.yml" = pkgs.writeTextFile {
    name = "bukkit.yml";
    text = builtins.readFile ./config/bukkit.yml;
  };
}
