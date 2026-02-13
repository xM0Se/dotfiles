[macos]
build bin="dMACOS":
    sudo darwin-rebuild switch --flake ~/dotfiles#{{ bin }} --impure

[linux]
build bin="minecraft-server":
    sudo nixos-rebuild switch --flake ~/dotfiles#{{ bin }}
