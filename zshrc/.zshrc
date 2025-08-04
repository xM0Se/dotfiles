eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.json)"

# ----------- neofetch on shell startup -----------
neofetch

alias bye='sudo shutdown -h now'
eval "$(atuin init zsh)"

#--------random stuff
export EDITOR="nvim"
export PAGER=bat
# ----------- eza better ls -----------
alias ls="eza --color=always --long --no-time --git --icons=always --no-user --no-permissions --color-scale-mode=gradient --grid --all --group-directories-first"
# ----------- clear keybind -----------
alias c='clear'
# ----------- zoxide -----------
eval "$(zoxide init zsh)"
# ----------- lock screen shortcut

eval "$(pay-respects zsh --alias)"

alias lock='pmset displaysleepnow'


alias wallpaper1='osascript -e '\''tell application "System Events" to set picture of every desktop to "/Users/moritz/GitHub/prod-quick-deployment-scripts/deployment-scripts/macOS/wallpaper/wallpaper1.jpg"'\'
alias wallpaper2='osascript -e '\''tell application "System Events" to set picture of every desktop to "/Users/moritz/GitHub/prod-quick-deployment-scripts/deployment-scripts/macOS/wallpaper/wallpaper2.jpg"'\'
alias wallpaper3='osascript -e '\''tell application "System Events" to set picture of every desktop to "/Users/moritz/GitHub/prod-quick-deployment-scripts/deployment-scripts/macOS/wallpaper/wallpaper3.jpg"'\'

# ----- fzf + bat + nvim ----- #
alias nzf='fzf --preview "bat --style=numbers,changes --color=always --theme=Dracula {}" --preview-window=right:60% | xargs -r nvim'
alias fzf='fzf --preview "bat --style=numbers,changes --color=always --theme=Dracula {}" --preview-window=right:60%'

alias wtc='curl -s https://whatthecommit.com/index.txt'                                                                                                             

alias prod='git checkout prod'
alias beta='git checkout beta'
alias alpha='git checkout Alpha'
alias pre-alpha='git checkout pre-alpha'
