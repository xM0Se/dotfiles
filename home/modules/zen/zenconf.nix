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
  ];

  zen-containers.enable = true;
  zen-spaces.enable = true;
  zen-extensions.enable = true;
  zen-search.enable = true;
  zen-mods.enable = true;

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
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
