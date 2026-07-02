# This Is a GitHub Repo of My Dotfiles

As I begin the transferring of all my dotfiles to nix you will be able to see the "normal" dotfiles in this repo: https://github.com/xM0Se/dotfiles-for-humans

Theme = Rosé Pine Moon  
Font = JetBrains Mono  
Window manager = AeroSpace  
Border = SketchyBar  
Text Editor = neovim  
Terminal multiplexer = Tmux  
Terminal = Ghossty  
Package manager = Nix, homebrew

<img width="3440" height="1440" alt="macOS-setup" src="https://github.com/user-attachments/assets/3bb381b9-9277-40ed-9bd6-c8bc85f28e53" />

## installation instructions macos

> [!WARNING]
> You have to give Terminal full disk access before executing.

```zsh
git clone https://github.com/xM0Se/dotfiles.git
```

```zsh
cd dotfiles
```

```zsh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

```zsh
sudo nix run nix-darwin#darwin-rebuild -- switch --flake ~/dotfiles#dMACOS
```
afterwards you can use ```j build ``` when in the dotfiles directory
