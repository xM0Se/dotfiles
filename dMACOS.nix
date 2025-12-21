{
  self,
  pkgs,
  ...
}: {
  imports = [
    ./configuration/system/mac-os/docksettings.nix
    ./configuration/system/mac-os/findersettings.nix
    ./pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix
    ./pkgs/nixpkgs-unstable/cli/u-pkg-all-cli-tools.nix
    ./pkgs/nixpkgs-unstable/gui/essential-gui-apps.nix
    ./pkgs/homebrew/b-opts-default.nix
    ./pkgs/homebrew/brews/b-brews-essentials.nix
    ./pkgs/homebrew/taps/b-taps-essentials.nix
    ./pkgs/homebrew/mas/b-mas-essentials.nix
    ./pkgs/homebrew/fonts/b-font-essentials.nix
    ./pkgs/homebrew/casks/b-cask-essentials.nix
  ];

  docksettings.enable = true;
  findersettings.enable = true;
  essential-cli-tools.enable = true;
  essential-gui-apps.enable = true;
  u-pkg-qmk.enable = true;
  u-pkg-neofetch.enable = false;
  b-opts-default.enable = true;
  b-taps-essentials.enable = true;
  b-brews-essentials.enable = true;
  b-mas-essentials.enable = true;
  b-font-essentials.enable = true;
  b-cask-essentials.enable = true;

  system.primaryUser = "xm0se";
  users.users.xm0se.home = "/Users/xm0se";

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [
    #cli tools
    pkgs.cargo
    pkgs.gtk3
    pkgs.stow
    pkgs.gh
    pkgs.cmatrix
    pkgs.nmap
    pkgs.nodejs_24
    pkgs.dwt1-shell-color-scripts
    pkgs.ripgrep
    pkgs.tldr
    pkgs.yazi
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    #Gui Apps
    pkgs.utm
    pkgs.raycast
    pkgs.anki-bin
    pkgs.bitwarden-desktop
    pkgs.wezterm
    pkgs.alacritty
    pkgs.ghostty-bin
    pkgs.obsidian
    pkgs.keycastr
    pkgs.vscode

    #fonts
    pkgs.jetbrains-mono
  ];

  #macOS setings

  #hot corners

  system.defaults.dock = {
    wvous-tr-corner = 1;
    wvous-tl-corner = 1;
    wvous-br-corner = 1;
    wvous-bl-corner = 1;
  };
  #other
  system.defaults.NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;
  system.defaults.WindowManager.EnableTilingByEdgeDrag = false;

  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  #Security stuff
  system.defaults.loginwindow.SHOWFULLNAME = true;
  system.defaults.loginwindow.GuestEnabled = false;
  networking.applicationFirewall.enable = true;
  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
  networking.applicationFirewall.enableStealthMode = true;
  system.defaults.screensaver.askForPassword = true;
  system.defaults.screensaver.askForPasswordDelay = 0;

  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = self.rev or self.dirtyRev or null;

  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
