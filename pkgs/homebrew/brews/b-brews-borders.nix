{ pkgs, lib, config, ... }: {

    options = {
        b-brews-borders.enable =
            lib.mkEnableOption "installs borders via homebrew and starts it on startup";
    };

    config = lib.mkIf config.b-brews-borders.enable {
        homebrew.brews = [
            { name = "borders"; start_service = true; }
        ];
    };

}
