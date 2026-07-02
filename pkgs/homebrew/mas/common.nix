{
  lib,
  config,
  ...
}: {
  imports = [
    ./dropover.nix
    ./davinciresolve.nix
  ];

  options = {
    brew.mas.common.enable =
      lib.mkEnableOption "common mas apps";
  };

  config = lib.mkIf config.brew.mas.common.enable {
    brew.mas = {
      dropover.enable =
        lib.mkDefault true;
      davinciresolve.enable =
        lib.mkDefault true;
    };
  };
}
