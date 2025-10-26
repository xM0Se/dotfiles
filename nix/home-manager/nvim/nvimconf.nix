{ pkgs, lib, config, ... }: {

    imports = [
    
    ];

    options = {
        h-nvimconf.enable =
            lib.mkEnableOption "config for nvim";
    };

    config = lib.mkIf config.h-nvimconf.enable {

    }; 

}
