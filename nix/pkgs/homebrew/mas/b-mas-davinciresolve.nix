{ pkgs, lib, config, ... }: {

    options = {
        b-mas-davinciresolve.enable =
            lib.mkEnableOption "installs DaVinciResolve via the mac appstore";
    };

    config = lib.mkIf config.b-mas-davinciresolve.enable {
        homebrew.masApps = {
            "DaVinciResolve" = 571213070;
        };
    };

}
