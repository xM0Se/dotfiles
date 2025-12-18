{
  lib,
  config,
  ...
}: {
  options = {
    gitconf.enable =
      lib.mkEnableOption "enables gitconf";
  };

  config = lib.mkIf config.gitconf.enable {
    programs.git = {
      enable = true;
      settings = {
        userName = {value = "xm0se";};
        userEmail = {value = "189546389+xM0Se@users.noreply.github.com";};
        aliases = {
          co = "checkout";
          pu = "push";
          com = "commit";
          a = "add";
        };
      };
      ignores = [
        "*.swp"
        "*.DS_Store"
      ];
    };
  };
}
