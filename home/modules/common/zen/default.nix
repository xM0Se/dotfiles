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
    ./policyTemplate.nix
    ./policies.nix
    ./settings.nix
    ./profile.nix
  ];

  zen = {
    profile = "default";
    extensions.enable = true;
    userChromeCSS.enable = true;
    containers.enable = true;
    spaces.enable = true;
    search.enable = false;
    mods.enable = true;
    bookmarks.enable = true;
    policyTemplate.enable = true;
    policies.enable = true;
    settings.enable = true;
  };
  programs.firefox.darwinDefaultsId = "app.zen-browser.zen";

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };
}
