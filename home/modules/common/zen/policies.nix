{
  lib,
  config,
  ...
}: {
  options = {
    zen.policies.enable =
      lib.mkEnableOption "zen-policies";
  };
  config = lib.mkIf config.zen.policies.enable {
    programs.zen-browser.policies.Preferences = {
      "privacy.resistFingerprinting" = {
        Value = true;
        Status = "locked";
      };
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
      "accessibility.typeaheadfind" = {
        Value = false;
        Status = "locked";
      };
      # ---------- Configuring Zen Mod "Zen Context Menu (v 3.1)"
      "widget.macos.native-context-menus" = {
        Value = false;
        Status = "locked";
      };
      "uc.hidecontext.separators" = {
        Value = true;
        Status = "locked";
      };
    };
  };
}
