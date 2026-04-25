{
  lib,
  config,
  ...
}: {
  options = {
    zen-extensions.enable =
      lib.mkEnableOption "extensions";
  };
  config = lib.mkIf config.zen-extensions.enable {
    programs.zen-browser.policies = let
      mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
        installation_mode = "force_installed";
      });
    in {
      ExtensionSettings = mkExtensionSettings {
        #To-do find out if it works with capital letters in description

        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = "vimium";
        "myallychou@gmail.com" = "unhook";
        "uBlock0@raymondhill.net" = "ublock";
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = "stylus";
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "return-youtube-dislike";
        "{8ad4bea8-ad8d-4e98-b434-a76065dee6cb}" = "prettier-lichess";
        "clipper@obsidian.md" = "obsidian-web-clipper";
        "addon@darkreader.org" = "dark-reader";
        "{3c6bf0cc-3ae2-42fb-9993-0d33104fdcaf}" = "improve-youtube";
      };
    };
  };
}
