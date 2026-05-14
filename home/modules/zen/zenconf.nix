{
  config,
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
  ];

  zen-containers.enable = true;
  zen-spaces.enable = true;
  zen-extensions.enable = true;
  zen-search.enable = true;
  zen-mods.enable = true;
  zen-user-chrome-css.enable = true;
  zen-bookmarks.enable = true;

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    profiles.default.settings = {
      "zen.workspaces.force-container-workspace" = true; #Switch to workspace where container is set as default when opening container tabs
      "zen.tabs.vertical" = true;
      "zen.tabs.vertical.right-side" = true;
      "zen.tabs.show-newtab-vertical" = false;
      "zen.welcome-screen.seen" = true;
    };
    policies = {
      Preferences = {
        "browser.aboutConfig.showWarning" = {
          Value = false;
          Status = "locked";
        };
        "browser.tabs.warnOnClose" = {
          Value = false;
          Status = "locked"; # User cannot change this
        };
        "browser.download.panel.shown" = {
          Value = true;
          Status = "locked";
        };
        "browser.download.useDownloadDir" = {
          Value = false;
          Status = "locked";
        };
        "browser.warnOnQuit" = {
          Value = false;
          Status = "locked";
        };
        "browser.warnOnQuitShortcut" = {
          Value = false;
          Status = "locked";
        };
      };
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
