{
  lib,
  config,
  ...
}: {
  options = {
    zen-policy-templates.enable =
      lib.mkEnableOption "zen-policy-templates";
  };
  config = lib.mkIf config.zen-policy-templates.enable {
    programs.zen-browser.policies = {
      AutofillAddressEnabled = false;
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
