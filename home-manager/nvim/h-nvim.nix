{ config, pkgs, lib, ... }:{

          programs.nvf.enable = true;

  # Inject your NVF module as a Home Manager module
  home.fileModules = [
      "${inputs.nvf}/home-manager"  # NVF module
    ./h-nvim.nix
  ];
}
