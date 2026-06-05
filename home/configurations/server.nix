{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./../modules/common/zsh/zsh.nix
    ./../modules/common/git.nix
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
