{
  pkgs,
  system,
  inputs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
    ./containers.nix
    ./spaces.nix
    ./extensions.nix
    ./search.nix
    ./mods.nix
    ./user-chrome-css.nix
    ./bookmarks.nix
    ./policy-templates.nix
    ./policies.nix
    ./settings.nix
  ];

  zen-containers.enable = true;
  zen-spaces.enable = true;
  zen-extensions.enable = true;
  zen-search.enable = true;
  zen-mods.enable = true;
  zen-user-chrome-css.enable = true;
  zen-bookmarks.enable = true;
  zen-policy-templates.enable = true;
  zen-policies.enable = true;
  zen-settings.enable = true;

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    nativeMessagingHosts = [
      pkgs.tridactyl-native
    ];
  };
  home.packages = [
    (
      inputs.zen-browser.packages."${system}".default.override {
        nativeMessagingHosts = [pkgs.firefoxpwa];
      }
    )
  ];
}
