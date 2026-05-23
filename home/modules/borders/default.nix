{pkgs, ...}: {
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;
    settings = {
      width = 8.0;
      hidpi = "on";
      active_color = "0xffeb6f92";
      inactive_color = "0xff44415a";
    };
  };
}
