{
  lib,
  config,
  ...
}: {
  options = {
    zen-containers.enable =
      lib.mkEnableOption "containers";
  };
  config = lib.mkIf config.zen-containers.enable {
    programs.zen-browser = {
      profiles."default" = {
        containersForce = true;
        containers = {
          programming = {
            color = "purple";
            icon = "circle";
            id = 1;
          };

          nix = {
            color = "blue";
            icon = "circle";
            id = 2;
          };

          cybersecurity = {
            color = "purple";
            icon = "fingerprint";
            id = 3;
          };

          devops = {
            color = "red";
            icon = "circle";
            id = 4;
          };

          keyboards = {
            color = "blue";
            icon = "circle";
            id = 5;
          };

          shopping = {
            color = "green";
            icon = "dollar";
            id = 6;
          };

          chess = {
            color = "green";
            icon = "circle";
            id = 7;
          };

          random-tabs = {
            color = "orange";
            icon = "circle";
            id = 8;
          };

          YouTube = {
            color = "red";
            icon = "chill";
            id = 9;
          };

          music = {
            color = "red";
            icon = "circle";
            id = 10;
          };

          school = {
            color = "blue";
            icon = "briefcase";
            id = 11;
          };
        };
      };
    };
  };
}
