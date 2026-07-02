{
  config,
  nixos-raspberrypi,
  ...
}: {
  imports = with nixos-raspberrypi.nixosModules; [
    raspberry-pi-5.base
  ];
  system.nixos.tags = let
    cfg = config.boot.loader.raspberry-pi;
  in [
    "raspberry-pi-${cfg.variant}"
    cfg.bootloader
    config.boot.kernelPackages.kernel.version
  ];
}
