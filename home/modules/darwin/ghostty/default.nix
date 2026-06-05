{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    settings = {
      mouse-hide-while-typing = true;
      copy-on-select = true;
      keybind = [
        "global:cmd+t+shift=toggle_quick_terminal"
        ''option+backspace=text:\x17''
      ];
      theme = "Rose Pine Moon";
      macos-titlebar-style = "hidden";
    };
  };
}
