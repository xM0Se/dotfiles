{pkgs, ...}: {
  programs.aerospace = {
    enable = true;
    package = pkgs.aerospace;
    launchd = {
      enable = true;
      keepAlive = true;
    };
    settings = {
      start-at-login = true;
      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "${pkgs.sketchybar}/bin/sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE"
      ];
      on-focus-changed = [
        "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --trigger aerospace_focus_change"
      ];

      gaps = {
        inner.horizontal = 18;
        inner.vertical = 18;

        outer.left = 88;
        outer.bottom = 18;
        outer.top = 18;
        outer.right = 18;
      };
      mode.main.binding = {
        alt-tab = "layout tiles horizontal vertical";
        alt-shift-tab = "layout accordion horizontal vertical";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-shift-0 = "resize smart -50";
        alt-0 = "resize smart +50";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-a = "workspace A";
        alt-b = "workspace B";
        alt-c = "workspace C";
        alt-d = "workspace D";
        alt-e = "workspace E";
        alt-f = "workspace F";
        alt-g = "workspace G";
        alt-i = "workspace I";
        alt-m = "workspace M";
        alt-n = "workspace N";
        alt-o = "workspace O";
        alt-p = "workspace P";
        alt-r = "workspace R";
        alt-s = "workspace S";
        alt-t = "workspace T";
        alt-u = "workspace U";
        alt-v = "workspace V";
        alt-w = "workspace W";
        alt-x = "workspace X";
        alt-y = "workspace Y";
        alt-z = "workspace Z";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-a = "move-node-to-workspace A";
        alt-shift-b = "move-node-to-workspace B";
        alt-shift-c = "move-node-to-workspace C";
        alt-shift-d = "move-node-to-workspace D";
        alt-shift-e = "move-node-to-workspace E";
        alt-shift-f = "move-node-to-workspace F";
        alt-shift-g = "move-node-to-workspace G";
        alt-shift-i = "move-node-to-workspace I";
        alt-shift-m = "move-node-to-workspace M";
        alt-shift-n = "move-node-to-workspace N";
        alt-shift-o = "move-node-to-workspace O";
        alt-shift-p = "move-node-to-workspace P";
        alt-shift-r = "move-node-to-workspace R";
        alt-shift-s = "move-node-to-workspace S";
        alt-shift-t = "move-node-to-workspace T";
        alt-shift-u = "move-node-to-workspace U";
        alt-shift-v = "move-node-to-workspace V";
        alt-shift-w = "move-node-to-workspace W";
        alt-shift-x = "move-node-to-workspace X";
        alt-shift-y = "move-node-to-workspace Y";
        alt-shift-z = "move-node-to-workspace Z";
      };

      on-window-detected = [
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
        {
          "if".app-id = "com.apple.Passwords";
          run = "layout floating";
        }
        {
          "if".app-id = "com.apple.SFSymbols";
          run = "layout floating";
        }
        {
          "if".app-id = "com.bitwarden.desktop";
          run = "layout floating";
        }
      ];
    };
  };
}
