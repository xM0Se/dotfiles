{pkgs, ...}: {
  programs.sketchybar = {
    enable = true;
    service.enable = true;
    includeSystemPath = true;
    extraPackages = [
    ];
    config = {
      source = ./config;
      recursive = true;
    };
  };
}
