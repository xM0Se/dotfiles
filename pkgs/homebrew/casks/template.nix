{
  lib,
  config,
  ...
}: {
  options = {
    brew.cask.template.enable =
      lib.mkEnableOption "template, template description";
  };

  config = lib.mkIf config.brew.cask.template.enable {
    homebrew.casks = [
      "template"
    ];
  };
}
