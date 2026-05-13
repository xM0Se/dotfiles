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
  ];

  zen-containers.enable = true;
  zen-spaces.enable = true;
  zen-extensions.enable = true;
  zen-search.enable = true;
  zen-mods.enable = true;
  zen-user-chrome-css.enable = true;

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    profiles.default.settings = {
      "zen.workspaces.force-container-workspace" = true; #Switch to workspace where container is set as default when opening container tabs
    };
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
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
