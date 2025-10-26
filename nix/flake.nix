{
  description = "xM0Se nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nixpkgs-unstable, nix-homebrew, home-manager }:
  let
    configuration1 = { pkgs, ... }: {
        imports = [
            ./configuration/system/mac-os/docksettings.nix
        ./configuration/system/mac-os/findersettings.nix
        ./pkgs/nixpkgs-unstable/cli/essential-cli-tools.nix  
        ./pkgs/nixpkgs-unstable/cli/u-pkgs-all-cli-tools.nix
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
    };
   configuration2 = { pkgs, lib, ... }: {
    nixpkgs.config.allowUnfree = true;
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
