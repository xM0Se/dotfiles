{
  pkgs,
  self,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./../modules/common/zsh/zsh.nix
    ./../modules/common/git.nix
  ];

  home.extraOptions = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };
  zshconf.enable = true;
  gitconf.enable = true;

  programs.home-manager.enable = true;
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "bat";
    };

    username = "xm0se";
    homeDirectory = "/xm0se";
    packages = [
      pkgs.hello
      self.packages.${pkgs.stdenv.hostPlatform.system}.nvimconf
    ];

    stateVersion = "25.05";
  };
}
