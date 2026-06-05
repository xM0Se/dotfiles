{pkgs, ...}: {
  imports = [
    ./workspaces.nix
    ./sketchybar.nix
    ./shortcuts.nix
    ./gaps.nix
    ./MoveToWorkspace.nix
    ./floating.nix
  ];
  programs.aerospace = {
    package = pkgs.aerospace;
    enable = true;
    launchd = {
      enable = true;
      keepAlive = true;
    };
    settings.start-at-login = true;
  };
}
