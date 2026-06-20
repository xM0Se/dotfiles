{
  lib,
  config,
  programs,
  pkgs,
  ...
}: let
  ext = import ./lib.nix {inherit lib config programs;};
in {
  options.zen.extensions.tridactyl.enable = lib.mkEnableOption "installs tridactyl";

  config = lib.mkIf ext.cfg.tridactyl.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "tridactyl.vim@cmcaine.co.uk" = "tridactyl-vim"; #Tridactyl
    };
    programs.zen-browser.nativeMessagingHosts = [pkgs.tridactyl-native];
    home.file.".tridactylrc".text = ''
      set searchurls.g https://www.google.com/search?q=%s
      set searchurls.ddg https://duckduckgo.com/?q=%s
      set searchurls.yt https://youtube.com/search?q=%s
      set searchurls.am https://www.amazon.de/s?k=%s
      set searchurls.no https://search.nixos.org/options?query=%s
      set searchurls.np https://search.nixos.org/packages?query=%s
      set searchurls.gh https://github.com/search?q=%s
      set searchurls.cve https://nvd.nist.gov/vuln/search/results?query=%s
    '';

    home.file."Library/Application Support/Mozilla/NativeMessagingHosts/tridactyl.json".source = "${pkgs.tridactyl-native}/lib/mozilla/native-messaging-hosts/tridactyl.json";
  };
}
