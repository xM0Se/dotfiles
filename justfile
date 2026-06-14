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

update-plugins:
    sh ~/dotfiles/configuration/modules/nixos/minecraft-servers/helper.sh > ~/dotfiles/configuration/modules/nixos/minecraft-servers/plugins.nix

deploy:
    colmena apply
