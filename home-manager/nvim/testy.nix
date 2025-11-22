{ pkgs, lib, ... }: {
    vim = {
        options = {
                tabstop = 4;
                shiftwidth = 4;
                softtabstop = 4;
                expandtab = true;
                smartindent = true;
        };
        theme = {
            enable = true;
            name = "rose-pine";
            style = "moon";
        };
        languages = {
        enableTreesitter = true;
        nix.enable = true;
        lua.enable = true;
        enableFormat = true;
    };
    };



}
