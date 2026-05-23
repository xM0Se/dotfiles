{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
    ./containers.nix
    ./spaces.nix
    ./extensions.nix
    ./search.nix
    ./mods.nix
    ./user-chrome-css.nix
    ./bookmarks.nix
    ./policy-templates.nix
    ./policies.nix
    ./settings.nix
  ];

  zen-containers.enable = true;
  zen-spaces.enable = true;
  zen-extensions.enable = true;
  zen-search.enable = true;
  zen-mods.enable = true;
  zen-user-chrome-css.enable = true;
  zen-bookmarks.enable = true;
  zen-policy-templates.enable = true;
  zen-policies.enable = true;
  zen-settings.enable = true;

  programs.firefox.darwinDefaultsId = "app.zen-browser.zen";

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    nativeMessagingHosts = [
      pkgs.tridactyl-native
    ];
  };

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
}
