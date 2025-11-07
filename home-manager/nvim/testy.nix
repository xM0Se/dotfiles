{ pkgs, lib, ... }: {
    vim = {
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
