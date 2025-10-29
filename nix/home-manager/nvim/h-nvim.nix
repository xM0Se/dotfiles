{ config, pkgs, inputs, nvf, ... }:{

    programs.nvf = {
        enable = true;
        modules = [
            ./testy.nix
        ];
    };
}

