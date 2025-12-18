{pkgs, ...}: {
  home.username = "root";
  home.homeDirectory = "/root";
  home.stateVersion = "25.05";
  imports = [
    ./gitconf.nix
    ./btopconf.nix
    ./zshconf.nix
    ./ohmyposhconf.nix
  ];
  gitconf.enable = true;
  btopconf.enable = true;
  zshconf.enable = true;
  ohmyposhconf.enable = true;
  home.packages = [
    pkgs.hello
  ];

  home.file = {
  };

  programs.home-manager.enable = true;
}
