{pkgs, ...}: {
  programs.sketchybar = {
    enable = true;
    service.enable = true;
    includeSystemPath = true;
    extraPackages = [
      pkgs.aerospace
    ];
    config = {
      source = ./config;
      recursive = true;
    };
  };
}
