{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./atuin/atuinconf.nix
    ./oh-my-posh/oh-my-poshconf.nix
    ./pay-respects/pay-respectsconf.nix
    ./zoxide/zoxideconf.nix
  ];

  options = {
    zshconf.enable = lib.mkEnableOption "zshconf";
  };

  config = lib.mkIf config.zshconf.enable {
    atuinconf.enable = true;
    oh-my-poshconf.enable = true;
    pay-respectsconf.enable = true;
    zoxideconf.enable = true;
    programs.zsh = {
      enable = true;
      plugins = [
        {
          name = "vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
      ];
      shellAliases = {
        j = "just";
        c = "clear";
        ls = "eza --color=always --long --no-time --git --icons=always --no-user --no-permissions --color-scale-mode=gradient --grid --all --group-directories-first -I  '.DS_Store'";
        nzf = "fzf --preview 'bat --style=numbers,changes --color=always --theme=RosePineMoon {}' --preview-window=right:60% | xargs -r nvim";
        fzf = "fzf --preview 'bat --style=numbers,changes --color=always --theme=RosePineMoon {}' --preview-window=right:60%";
      };
    };
  };
}
