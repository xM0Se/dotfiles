{ pkgs, lib, config, ... }: {

    imports = [
        ./b-mas-dropover.nix
        ./b-mas-davinciresolve.nix
    ];

    options = {
        b-mas-essentials.enable =
            lib.mkEnableOption "installs apps form the mac app store";
    };

    config = lib.mkIf config.b-mas-essentials.enable {
        b-mas-dropover.enable =
            lib.mkDefault true;
        b-mas-davinciresolve.enable =
            lib.mkDefault true;
    };

}
