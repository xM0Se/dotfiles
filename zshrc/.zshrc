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

# -----------
preview() {
  if [[ -d $1 ]]; then
    exa --tree --level=2 --color=always --group-directories-first "$1"
  elif [[ -f $1 ]]; then
    bat --style=numbers --color=always --paging=never "$1" | head -n 200
  else
    echo "preview: '$1' not found" >&2
    return 1
  fi
}
alias pv='preview'

if type fzf &>/dev/null; then
  preview_fzf() {
    local dir=${1:-.}
    FZF_DEFAULT_OPTS="
      --preview '  
        if [[ -d {} ]]; then
          eza --tree --color=always --group-directories-first {}
        else
          bat --style=numbers --color=always --paging=never {}
        fi
      '  
      --preview-window='right:60%'  
    " fzf --layout=reverse --height=40% --border --ansi < <(find "$dir" -maxdepth 2)
  }
  alias pf='preview_fzf'
fi


if type fzf &>/dev/null; then
  preview_fzf() {
    local dir=${1:-.}
    FZF_DEFAULT_OPTS="
      --preview '  
        if [[ -d {} ]]; then
          eza --tree --color=always --group-directories-first {}
        else
          bat --style=numbers --color=always --paging=never {}
        fi
      '  
      --preview-window='right:60%'  
    " fzf --layout=reverse --height=40% --border --preview-window=right:60% | xargs -r nvim
-ansi < <(find "$dir" -maxdepth 2)
  }
  alias pn='preview_fzf'
fi


# ----------- neofetch on shell startup -----------
neofetch

alias bye='sudo shutdown -h now'
eval "$(atuin init zsh)"

. "$HOME/.atuin/bin/env"

# ----- vimliketerminal ----- #
set -o vi
#--------random stuff
export EDITOR="nvim"
export PAGER=bat
# ----------- eza better ls -----------
alias ls="eza --color=always --long --no-time --git --icons=always --no-user --no-permissions --color-scale-mode=gradient --grid --all --group-directories-first"
# ----------- the fuck -----------
eval $(thefuck --alias)
eval $(thefuck --alias f)
# ----------- clear keybind -----------
alias c='clear'
# ----------- zoxide -----------
eval "$(zoxide init zsh)"
# ----------- lock screen shortcut

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
