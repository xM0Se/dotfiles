{lib, ...}: {
  home.activation = {
    removeWidgets = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "Removing all widgets"
      /usr/bin/defaults write com.apple.WindowManager StandardHideWidgets -bool true
      /usr/bin/defaults write com.apple.WindowManager StageManagerHideWidgets -bool true
      /usr/bin/killall WindowManager
    '';
  };
}
