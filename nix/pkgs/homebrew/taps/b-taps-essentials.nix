{ pkgs, lib, config, ... }: {

    imports = [
        ./b-taps-felixkratz.nix
       ./b-taps-nikitabobko.nix
    ];

    options = {
        b-taps-essentials.enable =
            lib.mkEnableOption "enables essential-brew cli tools";
    };

    config = lib.mkIf config.b-taps-essentials.enable {
        b-taps-felixkratz.enable =
             lib.mkDefault true;
        b-taps-nikitabobko.enable =
            lib.mkDefault true;
    };

}
