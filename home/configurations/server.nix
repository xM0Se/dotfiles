{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./../modules/common/zsh/zsh.nix
    ./../modules/common/git.nix
    ./../modules/common/sops.nix
  ];

  zshconf.enable = true;
  gitconf.enable = true;

  programs.home-manager.enable = true;
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "bat";
    };

    username = "admin";
    homeDirectory = "/admin";
    packages = [
      pkgs.hello
      self.packages.${pkgs.stdenv.hostPlatform.system}.nvimconf
    ];

    stateVersion = "25.05";
  };
}
