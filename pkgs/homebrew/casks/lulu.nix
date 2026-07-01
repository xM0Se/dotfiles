{
  lib,
  config,
  ...
}: {
  options = {
    brew.cask.lulu.enable =
      lib.mkEnableOption "lulu, outbound network firewall";
  };

  config = lib.mkIf config.brew.cask.lulu.enable {
    homebrew.casks = [
      "lulu"
    ];
  };
}
