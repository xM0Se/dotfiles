{
  description = "xM0Se nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
  let
    configuration1 = { pkgs, ... }: {
      imports = [
        ./configuration/system/mac-os/docksettings.nix
        ./configuration/system/mac-os/findersettings.nix
        ./pkgs/homebrew/Casks/b-cask-essentials.nix
        ./pkgs/nixpkgs-unstable/cli/essential-cli-tools.nix  
        ./pkgs/nixpkgs-unstable/cli/u-pkgs-all-cli-tools.nix
        ./pkgs/nixpkgs-unstable/gui/essential-gui-apps.nix
        ./pkgs/homebrew/fonts/b-fonts-essentials.nix
      ]; 
      docksettings.enable = true;
      findersettings.enable = true;
      essential-brew-mac-apps.enable = true;
      essential-cli-tools.enable = true;
      essential-gui-apps.enable = true;
      essential-brew-fonts.enable = true;

      system.primaryUser = "xm0se";
      users.users.xm0se.home = "/Users/xm0se";

      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = [
          #cli tools
          pkgs.cmatrix
          pkgs.nmap 

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
        masApps = {
          "dropover" = 1355679052;
          "DaVinciResolve" = 571213070;
        };
      };

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


      nix.settings.experimental-features = "nix-command flakes";

      system.configurationRevision = self.rev or self.dirtyRev or null;

      system.stateVersion = 6;

      nixpkgs.hostPlatform = "aarch64-darwin";
    };
   configuration2 = { pkgs, lib, ... }: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages =
    [
     pkgs.cmatrix
     pkgs.zsh
    ];
    imports = [
       ./pkgs/nixpkgs-unstable/cli/essential-cli-tools.nix
    ];

    essential-cli-tools.enable = true;
    users.users.root.home = "/root";
    users.users.root.shell = pkgs.zsh;
    programs.zsh.enable = true;
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
