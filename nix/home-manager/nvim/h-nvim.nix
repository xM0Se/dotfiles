{ config, pkgs, inputs, ... }:{

    imports = [
        inputs.nvf.homeManagerModules.default
    ];

    programs.nvf = {
        enable = true;
        settings = {
            modules = [
                ./nvim/testy.nix
            ];
        };
    };
}

