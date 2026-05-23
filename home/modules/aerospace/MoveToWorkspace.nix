{...}: {
  programs.aerospace.settings.on-window-detected = [
    {
      "if".app-id = "app.zen-browser.zen";
      run = "move-node-to-workspace B";
    }
    {
      "if".app-id = "md.obsidian";
      run = "move-node-to-workspace N";
    }
    {
      "if".app-id = "dev.vencord.vesktop";
      run = "move-node-to-workspace D";
    }
    {
      "if".app-id = "com.apple.finder";
      run = "move-node-to-workspace F";
    }
    {
      "if".app-id = "com.softfever3d.orca-slicer";
      run = "move-node-to-workspace 3";
    }
    {
      "if".app-id = "com.mitchellh.ghostty";
      run = "move-node-to-workspace G";
    }
    {
      "if".app-id = "com.apple.MobileSMS";
      run = "move-node-to-workspace 1";
    }
    {
      "if".app-id = "com.automattic.beeper.desktop";
      run = "move-node-to-workspace M";
    }
    {
      "if".app-id = "net.nymtech.vpn";
      run = "move-node-to-workspace 1";
    }
  ];
}
