# ----------- ohmyzsh amd powerlevel10k -----------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# ----------- neofetch on shell startup -----------
neofetch

eval "$(atuin init zsh)"

. "$HOME/.atuin/bin/env"


# ----------- eza better ls -----------
alias ls="eza --color=always --long --no-time --git --icons=always --no-user --no-permissions --hyperlink --color-scale-mode=gradient --grid --all --group-directories-first"
# ----------- the fuck -----------
eval $(thefuck --alias)
eval $(thefuck --alias f)
# ----------- clear keybind -----------
alias c='clear'
# ----------- zoxide -----------
eval "$(zoxide init zsh)"
# ----------- lock screen shortcut

alias lock='pmset displaysleepnow'

alias fzf='fzf --preview "bat --style=numbers,changes --color=always {}" --preview-window=right:60% | xargs -r nvim'

alias ng='open -n -a Ghostty.app'
alias nw='open -n -a WezTerm.app'
