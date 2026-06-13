{config, ...}: {
  home = {
    username = "xm0se";
    homeDirectory = "/Users/xm0se";
  };
  sops.secrets = {
    "ssh-private-keys/github" = {
      path = "${config.home.homeDirectory}/.ssh/github";
      mode = "0600";
    };
    "ssh-private-keys/nixServer/moritz" = {
      path = "${config.home.homeDirectory}/.ssh/nix-server-moritz";
      mode = "0600";
    };
    "ssh-private-keys/nixServer/deploy" = {
      path = "${config.home.homeDirectory}/.ssh/nix-server-deploy";
      mode = "0600";
    };
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/github";
      };
      "nix-server-moritz" = {
        HostName = "116.203.223.177";
        User = "moritz";
        IdentityFile = "~/.ssh/nix-server-moritz";
      };
      "nix-server-deploy" = {
        HostName = "116.203.223.177";
        User = "deploy";
        IdentityFile = "~/.ssh/nix-server-deploy";
      };
    };
  };
}
