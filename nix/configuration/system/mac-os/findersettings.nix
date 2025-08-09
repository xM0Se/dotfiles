{ pkgs, lib, config, ... }: {

  options = {
    findersettings.enable =
      lib.mkEnableOption "enables custom finder settings";
  };

  config = lib.mkIf config.findersettings.enable {

    system.defaults.finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      FXRemoveOldTrashItems = true;
      NewWindowTarget = "Home";
      QuitMenuItem = true;
      ShowExternalHardDrivesOnDesktop = false;
      ShowPathbar = true;
      ShowRemovableMediaOnDesktop = false;
      ShowStatusBar = true;
      CreateDesktop = false;
    };

  };
}
