{config, ...}: {
  home = {
    username = "xm0se";
    homeDirectory = "/Users/xm0se";
  };
  sops.secrets = {
    "ssh-private-keys/github" = {
      path = "${config.homeDirectory}/.ssh/github";
      mode = "0600";
    };
    "ssh-private-keys/nixServer/moritz" = {
      path = "${config.home.homeDirectory}/.ssh/nix-server-moritz";
      mode = "0600";
    };
    "ssh-private-keys/nixServer/deploy" = {
      path = "${config.homeDirectory}/.ssh/nix-server-deploy";
      mode = "0600";
    };
  };
  programs.ssh.settings = {
    "github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/github";
    };
    "nix-server-moritz" = {
      hostname = "116.203.223.177";
      user = "moritz";
      identityFile = "~/.ssh/nix-server-deploy";
    };
    "nix-server-deploy" = {
      hostname = "116.203.223.177";
      user = "deploy";
      identityFile = "~/.ssh/nix-server-deploy";
    };
  };
}
