{
  lib,
  config,
  ...
}: let
  cfg = config.zen.extensions;
in {
  imports = [
    ./bitwarden.nix
    ./archivePage.nix
    ./uBlockOrigin.nix
    ./darkReader.nix
    ./youtubeAddons.nix
    ./keepa.nix
    ./noScript.nix
    ./stylus.nix
    ./obsidianWebClipper.nix
    ./multiAccountContainers.nix
    ./tampermonkey.nix
    ./prettierLichess.nix
    ./tridactyl.nix
  ];
  options.zen.extensions.enable = lib.mkEnableOption "installs all extensions";
  config = lib.mkIf cfg.enable {
    zen.extensions = {
      bitwarden.enable =
        lib.mkDefault true;
      archivePage.enable =
        lib.mkDefault true;
      uBlockOrigin.enable =
        lib.mkDefault true;
      darkReader.enable =
        lib.mkDefault true;
      youtubeAddons.enable =
        lib.mkDefault true;
      keepa.enable =
        lib.mkDefault true;
      noScript.enable =
        lib.mkDefault true;
      stylus.enable =
        lib.mkDefault true;
      obsidianWebClipper.enable =
        lib.mkDefault true;
      multiAccountContainers.enable =
        lib.mkDefault true;
      tampermonkey.enable =
        lib.mkDefault true;
      prettierLichess.enable =
        lib.mkDefault true;
      tridactyl.enable =
        lib.mkDefault true;
    };
  };
}
