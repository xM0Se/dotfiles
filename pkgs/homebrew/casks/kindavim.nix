{
  lib,
  config,
  ...
}: {
  options = {
    brew.cask.kindavim.enable =
      lib.mkEnableOption "kindavim, system-wide vim keybindings";
  };

  config = lib.mkIf config.brew.cask.kindavim.enable {
    homebrew.casks = [
      "kindavim"
    ];
  };
}
