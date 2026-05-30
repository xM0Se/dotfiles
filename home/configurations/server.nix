{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./../modules/zsh/zshconf.nix
    ./../modules/gitconf.nix
  ];

  zshconf.enable = true;
  gitconf.enable = true;

  programs.home-manager.enable = true;
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "bat";
    };

    username = "root";
    homeDirectory = "/root";
    packages = [
      pkgs.hello
      self.packages.${pkgs.stdenv.hostPlatform.system}.nvimconf
    ];

    stateVersion = "25.05";
  };
}
