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
        #Name of the extensions and ids can be found at about:support
        "{3c6bf0cc-3ae2-42fb-9993-0d33104fdcaf}" = "'Improve YouTube!' 🎧 (for YouTube & Videos)";
        "{5b22cb75-8e43-4f2a-bb9b-1da0655ae564}" = "Archive Page";
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "Bitwarden Password Manager";
        "addon@darkreader.org" = "Dark Reader";
        "@testpilot-containers" = "Firefox Multi-Account Containers";
        "amptra@keepa.com" = "Keepa - Amazon Price Tracker";
        "clipper@obsidian.md" = "Obsidian Web Clipper";
        "{8ad4bea8-ad8d-4e98-b434-a76065dee6cb}" = "Prettier Lichess";
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "Return YouTube Dislike";
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = "Stylus";
        "firefox@tampermonkey.net" = "Tampermonkey";
        "uBlock0@raymondhill.net" = "uBlock Origin";
        "myallychou@gmail.com" = "Unhook - Remove YouTube Recommended & Shorts";
        "vimium-c@gdh1995.cn" = "Vimium C - All by Keyboard";
      };
    };
  };
}
