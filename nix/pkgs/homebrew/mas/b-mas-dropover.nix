{ pkgs, lib, config, ... }: {

    options = {
        b-mas-dropover.enable =
            lib.mkEnableOption "installs dropover via the mac appstore";
    };

    config = lib.mkIf config.b-mas-dropover.enable {
        homebrew.masApps = {
            "dropover" = 1355679052;
        };
    };

}
