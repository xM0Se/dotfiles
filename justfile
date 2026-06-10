[macos]
build bin="dMACOS":
    sudo darwin-rebuild switch --flake ~/dotfiles#{{ bin }}

[linux]
build bin="minecraft-server":
    sudo nixos-rebuild switch --flake ~/dotfiles#{{ bin }}

up:
    nix flake update

gc:
    sudo nix-collect-garbage --delete-old
