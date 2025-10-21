{ pkgs, lib, config, ... }: {

    options = {
        b-taps-nikitabobko.enable = lib.mkEnableOption {
            description = "taps into nikitabobko tap";
        };
    };

    config = lib.mkIf config.b-taps-nikitabobko.enable {
        homebrew = {
            taps = [
                "nikitabobko/tap"
            ];
        };
    };

}
