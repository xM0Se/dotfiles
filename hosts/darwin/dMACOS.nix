{
  self,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.sops-nix.darwinModules.sops
    ../../configuration/system/mac-os/docksettings.nix
    ../../configuration/system/mac-os/findersettings.nix
    ../../pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix
    ../../pkgs/nixpkgs-unstable/cli/u-pkg-all-cli-tools.nix
    ../../pkgs/nixpkgs-unstable/gui/essential-gui-apps.nix
    ../../pkgs/homebrew/b-opts-default.nix
    ../../pkgs/homebrew/brews/b-brews-essentials.nix
    ../../pkgs/homebrew/taps/b-taps-essentials.nix
    ../../pkgs/homebrew/mas/b-mas-essentials.nix
    ../../pkgs/homebrew/fonts/b-font-essentials.nix
    ../../pkgs/homebrew/casks/b-cask-essentials.nix
  ];

  # todo move to seperate file
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/user/.config/sops/age/keys.txt";
  sops.secrets.example-key = {};
  # --

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
    pkgs.age
    pkgs.sops
    #cli tools
    pkgs.vesktop
    #--custom nvim package todo: move to home-manager
    self.packages.${pkgs.stdenv.hostPlatform.system}.nvimconf
    #--
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
  ];

  #macOS setings

  #Security stuff
  networking = {
    applicationFirewall = {
      enable = true;
      enableStealthMode = true;
    };
  };

  system.defaults = {
    loginwindow = {
      SHOWFULLNAME = true;
      GuestEnabled = false;
    };

    NSGlobalDomain = {
      NSAutomaticWindowAnimationsEnabled = false;
      _HIHideMenuBar = true;
    };

    WindowManager.EnableTilingByEdgeDrag = false;
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

    dock = {
      wvous-tr-corner = 1;
      wvous-tl-corner = 1;
      wvous-br-corner = 1;
      wvous-bl-corner = 1;
    };

    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };
  };

  # ---
  nix.settings.experimental-features = "nix-command flakes";

  system = {
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 6;
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
}
