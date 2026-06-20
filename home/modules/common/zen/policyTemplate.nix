{
  lib,
  config,
  ...
}: {
  options.zen.policyTemplate.enable =
    lib.mkEnableOption "zen-policy-template";

  config = lib.mkIf config.zen.policyTemplate.enable {
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
