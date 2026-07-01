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

  config = lib.mkIf config.b-mas-essentials.enable {
    dropover.enable =
      lib.mkDefault true;
    davinciresolve.enable =
      lib.mkDefault true;
  };
}
