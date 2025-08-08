{
  description = "xM0Se nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager = {
                     url = "github:nix-community/home-manager/master";
                     inputs.nixpkgs.follows = "nixpkgs";
                   };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
  let
    configuration1 = { pkgs, ... }: {
      system = {
                primaryUser = "xm0se";
               };
      users.users.xm0se.home = "/Users/xm0se";

      nixpkgs.config.allowUnfree = true;
      environment.systemPackages =
        [
          #cli tools
          pkgs.oh-my-posh
          pkgs.eza
          pkgs.atuin
          pkgs.zoxide
          pkgs.neofetch
          pkgs.vim
          pkgs.neovim
          pkgs.tmux
          pkgs.fzf
          pkgs.btop
          pkgs.bat
          pkgs.cmatrix
          pkgs.git
          pkgs.nmap
          pkgs.pay-respects
          pkgs.tldr
          pkgs.yazi
          pkgs.zsh-autosuggestions
          pkgs.zsh-syntax-highlighting
          #Gui Apps
          pkgs.jankyborders
          pkgs.raycast
          pkgs.anki-bin
          pkgs.bitwarden
          pkgs.wezterm
          pkgs.alacritty
          pkgs.ghostty-bin
          pkgs.obsidian
          pkgs.keycastr
          pkgs.vscode

          #nvim
          pkgs.vimPlugins.LazyVim
          #fonts
          pkgs.jetbrains-mono

          #VS-Code exetensions
          pkgs.vscode-extensions.dracula-theme.theme-dracula
          pkgs.vscode-extensions.vscodevim.vim
        ];

      homebrew = {
                 enable = true;
                 onActivation.cleanup = "zap";
                 taps =  [
                          "FelixKratz/formulae"
                          "nikitabobko/tap"
                         ];
                 brews = [
                         { name = "sketchybar"; start_service = true; }
                         ];

                 casks = [
                         #Apps
                         "zen"
                         "twingate"
                         "signal"
                         "mullvad-vpn"
                         "orcaslicer"
                         "aerospace"
                         "minecraft"
                         "logi-options+"
                         #fonts
                         "font-sketchybar-app-font"
                         "sf-symbols"
                         "font-hack-nerd-font"
                         ];

                 masApps = {
                           "dropover" = 1355679052;
                           "DaVinciResolve" = 571213070;
                           };


                 };

      #macOS setings

      #dock settings

      system.defaults.dock = {
                                autohide = true;
                                tilesize = 1;
                                orientation = "left";         # Dock on the left
                                static-only = true;
                                autohide-delay = 5.0;
                                show-recents = false;
                                show-process-indicators = false;
                             };

      #Finder
      system.defaults.finder = {
                                AppleShowAllExtensions = true;
                                AppleShowAllFiles = true;
                                FXDefaultSearchScope = "SCcf";
                                FXEnableExtensionChangeWarning = false;
                                FXRemoveOldTrashItems = true;
                                NewWindowTarget = "Home";
                                QuitMenuItem = true;
                                ShowExternalHardDrivesOnDesktop = false;
                                ShowPathbar = true;
                                ShowRemovableMediaOnDesktop = false;
                                ShowStatusBar = true;
                                CreateDesktop = false;
                               };



      system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
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

      #jankyborders
      services.jankyborders = {
                                enable = true;
                                active_color = "0xffffffff";
                                hidpi = false;
                                inactive_color = "0xff56606d";
                                style = "round";
                                width = 6.0;
                              };
      system.defaults.NSGlobalDomain._HIHideMenuBar = true;

      #Security stuff
      system.defaults.loginwindow.SHOWFULLNAME = true;
      system.defaults.loginwindow.GuestEnabled = false;
      networking.applicationFirewall.enable = true;
      system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      networking.applicationFirewall.enableStealthMode = true;
      system.defaults.screensaver.askForPassword = true;
      system.defaults.screensaver.askForPasswordDelay = 0;



      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";


    };
   configuration2 = { pkgs, lib, ... }: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages =
    [
     pkgs.cmatrix
    ];
    imports = [
       ./pkgs/nixpkgs-unbstable/cli/essential-cli-tools.nix
    ];

    essential-cli-tools.enable = true;
    users.users.root.home = "/root";
    home-manager.backupFileExtension = "hm-backup";


                        
    nixpkgs.hostPlatform = "x86_64-linux";
  };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."dMACOS" = nix-darwin.lib.darwinSystem {
      modules = [
                configuration1
                home-manager.darwinModules.home-manager {
                 home-manager.useGlobalPkgs = true;
                 home-manager.useUserPackages = true;
                 home-manager.users.xm0se = ./home-manager/home1.nix;}
                nix-homebrew.darwinModules.nix-homebrew
                {
                  nix-homebrew = {
                                  enable = true;
                                  enableRosetta = true;
                                  user = "xm0se";
                                  };
                }
                ];
    };

    nixosConfigurations."test" = nixpkgs.lib.nixosSystem {
      modules = [
        home-manager.nixosModules.home-manager {
         home-manager.useGlobalPkgs = true;
         home-manager.useUserPackages = true;
         home-manager.users.root = ./home-manager/home2.nix;}
        configuration2
        ./hosts/nix-os/servers/test1/configuration.nix
      ];
    };
  };
}
