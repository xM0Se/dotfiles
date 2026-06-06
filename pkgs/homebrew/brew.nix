{
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    brew.enable = lib.mkEnableOption "brew";
  };

  config = lib.mkIf config.brew.enable {
    imports = [
      inputs.nix-homebrew.darwinModules.nix-homebrew
    ];
    nix-homebrew = {
      enable = true;
      enableRosetta = true;
      user = "xm0se";
    };
    homebrew = {
      enable = true;
      onActivation.cleanup = "zap";
    };
  };
}
