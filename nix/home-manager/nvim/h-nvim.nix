{ config, pkgs, inputs, nvf, ... }:{

    programs.nvf = {
        enable = true;
        settings = {
            modules = [
                ./nvim/testy.nix
            ];
        };
    };
}

