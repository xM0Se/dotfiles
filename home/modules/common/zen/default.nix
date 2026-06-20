{inputs, ...}: {
  imports = [
    inputs.zen-browser.homeModules.beta
    ./containers.nix
    ./spaces.nix
    ./extensions/extensions.nix
    ./search.nix
    ./mods.nix
    ./user-chrome-css.nix
    ./bookmarks.nix
    ./policy-templates.nix
    ./policies.nix
    ./settings.nix
    ./profile.nix
  ];

  zen = {
    profile = "default";
    extensions.enable = true;
    userChromeCSS.enable = true;
  };
  zen-containers.enable = true;
  zen-spaces.enable = true;
  zen-search.enable = true;
  zen-mods.enable = true;
  zen-bookmarks.enable = true;
  zen-policy-templates.enable = true;
  zen-policies.enable = true;
  zen-settings.enable = true;

  programs.firefox.darwinDefaultsId = "app.zen-browser.zen";

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };
}
