[macos]
build bin="dMACOS":
    sudo darwin-rebuild switch --flake ~/dotfiles#{{ bin }} --impure
