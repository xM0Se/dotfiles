{ config, pkgs, inputs, nvf, ... }:{

    programs.nvf = {
        enable = true;
        settings = {
            modules = [
                ./testy.nix
            ];
        };
    };
}

