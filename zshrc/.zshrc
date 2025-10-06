eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.json)"

eval "$(atuin init zsh)"

export EDITOR="nvim"
export PAGER=bat

alias c='clear'

eval "$(zoxide init zsh)"

eval "$(pay-respects zsh --alias)"

alias vim=nvim

alias ls="eza --color=always --long --no-time --git --icons=always --no-user --no-permissions --color-scale-mode=gradient --grid --all --group-directories-first"

alias nzf='fzf --preview "bat --style=numbers,changes --color=always --theme=Dracula {}" --preview-window=right:60% | xargs -r nvim'
alias fzf='fzf --preview "bat --style=numbers,changes --color=always --theme=Dracula {}" --preview-window=right:60%'

