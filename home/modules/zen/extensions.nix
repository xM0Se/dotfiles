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
        # Format is as follows
        # "extension ID can be found at about:support" = "pluginId end url of the plugin"; #Display name of plugin in store
        "{3c6bf0cc-3ae2-42fb-9993-0d33104fdcaf}" = "youtube-addon"; #'Improve YouTube!' 🎧 (for YouTube & Videos)
        "{5b22cb75-8e43-4f2a-bb9b-1da0655ae564}" = "archive-page"; #Archive Page
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager"; #Bitwarden Password Manager
        "addon@darkreader.org" = "darkreader"; #Dark Reader
        "@testpilot-containers" = "multi-account-containers"; #Firefox Multi-Account Containers
        "amptra@keepa.com" = "keepa"; #Keepa - Amazon Price Tracker
        "clipper@obsidian.md" = "web-clipper-obsidian"; #Obsidian Web Clipper
        "{8ad4bea8-ad8d-4e98-b434-a76065dee6cb}" = "prettier-lichess"; #Prettier Lichess
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "return-youtube-dislikes"; #Return YouTube Dislike
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = "styl-us"; #Stylus
        "firefox@tampermonkey.net" = "Tampermonkey"; #Tampermonkey
        "tridactyl.vim@cmcaine.co.uk" = "tridactyl-vim"; #Tridactyl
        "uBlock0@raymondhill.net" = "ublock-origin"; #uBlock Origin
        "myallychou@gmail.com" = "youtube-recommended-videos"; #Unhook: Remove YouTube Recommended Videos Comments
      };
    };
  };
}
