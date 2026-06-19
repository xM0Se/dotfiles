{
  inputs,
  self,
  pkgs,
  ...
}: {
  imports = [
    (self + "/pkgs/nixpkgs-unstable/cli/u-pkg-essential-cli-tools.nix")
    (self + "/pkgs/nixpkgs-unstable/cli/u-pkg-all-cli-tools.nix")
    (self + "/pkgs/nixpkgs-unstable/gui/essential-gui-apps.nix")
    (self + "/pkgs/homebrew/brew.nix")
    (self + "/pkgs/homebrew/mas/b-mas-essentials.nix")
    (self + "/pkgs/homebrew/fonts/b-font-essentials.nix")
    (self + "/pkgs/homebrew/casks/b-cask-essentials.nix")
    (self + "/configuration/configurations/darwin.nix")
  ];

  essential-cli-tools.enable = true;
  essential-gui-apps.enable = true;
  u-pkg-qmk.enable = true;
  b-mas-essentials.enable = true;
  b-font-essentials.enable = true;
  b-cask-essentials.enable = true;

  home-manager.users.xm0se.imports = [
    (self + "/home/configurations/darwin.nix")
    (self + "/home/users/xm0se.nix")
  ];
  users.users.xm0se.home = "/Users/xm0se";

  environment.systemPackages = [
    inputs.colmena.packages.${pkgs.stdenv.hostPlatform.system}.colmena
    #--
    pkgs.mas
    pkgs.age
    pkgs.sops
    #CLI tools
    pkgs.browsers
    pkgs.fastfetch
    pkgs.nym
    pkgs.stow
    pkgs.gh
    pkgs.cmatrix
    pkgs.nmap
    pkgs.dwt1-shell-color-scripts
    pkgs.ripgrep
    pkgs.tldr
    pkgs.raycast
    pkgs.tree
    pkgs.anki-bin
    # pkgs.bitwarden-desktop
    pkgs.obsidian
    pkgs.keycastr
    pkgs.vscode
  ];

  networking = {
    applicationFirewall = {
      enable = true;
      enableStealthMode = true;
    };
  };

  system = {
    primaryUser = "xm0se";
    defaults = {
      loginwindow = {
        SHOWFULLNAME = true;
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };

      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleIconAppearanceTheme = "RegularDark";
        AppleInterfaceStyleSwitchesAutomatically = false;
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        ApplePressAndHoldEnabled = false;
        AppleTemperatureUnit = "Celsius";
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSWindowShouldDragOnGesture = false;
        "com.apple.keyboard.fnState" = true;

        _HIHideMenuBar = true;
      };
      screencapture = {
        target = "clipboard";
        type = "jpg";
      };
      universalaccess.reduceMotion = true;

      WindowManager = {
        EnableTilingByEdgeDrag = false;
        EnableStandardClickToShowDesktop = false;
        EnableTopTilingByEdgeDrag = false;
        GloballyEnabled = false;
      };
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };
    };

    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 6;
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
}
