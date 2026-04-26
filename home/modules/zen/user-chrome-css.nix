{
  lib,
  config,
  ...
}: {
  options = {
    zen-user-chrome-css.enable =
      lib.mkEnableOption "user-chrome-css";
  };
  config = lib.mkIf config.zen-user-chrome-css.enable {
    programs.zen-browser.profiles."default" = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "zen.themes.disable-all" = false;
      };
      # Warning to future self the user-Chrome-CSS is vibe coded because rose-pine-moon ones was broken
      userChrome = ''
        * {
          --base:           #232136;
          --surface:        #2a273f;
          --overlay:        #393552;
          --muted:          #6e6a86;
          --subtle:         #908caa;
          --text:           #e0def4;
          --love:           #eb6f92;
          --gold:           #f6c177;
          --rose:           #ea9a97;
          --pine:           #3e8fb0;
          --foam:           #9ccfd8;
          --iris:           #c4a7e7;
          --highlightLow:   #2a283e;
          --highlightMed:   #44415a;
          --highlightHigh:  #56526e;
        }
        :root {
          --zen-branding-dark: var(--base) !important;
          --zen-branding-paper: var(--text) !important;
          --zen-branding-bg: var(--base) !important;
          --zen-branding-bg-reverse: var(--text) !important;

          --zen-primary-color: var(--iris) !important;

          --zen-colors-primary: var(--iris) !important;
          --zen-colors-secondary: var(--surface) !important;
          --zen-colors-tertiary: var(--overlay) !important;
          --zen-colors-border: var(--iris) !important;

          --toolbarbutton-icon-fill: var(--iris) !important;

          --lwt-text-color: var(--text) !important;
          --toolbar-field-color: var(--text) !important;
          --tab-selected-textcolor: var(--iris) !important;
          --toolbar-field-focus-color: var(--text) !important;
          --toolbar-color: var(--text) !important;
          --newtab-text-primary-color: var(--text) !important;
          --arrowpanel-color: var(--text) !important;
          --sidebar-text-color: var(--text) !important;
          --lwt-sidebar-text-color: var(--text) !important;

          --lwt-sidebar-background-color: var(--base) !important;
          --arrowpanel-background: var(--overlay) !important;
          --newtab-background-color: var(--overlay) !important;

          --zen-navigator-toolbox-background: var(--base) !important;
          --zen-themed-toolbar-bg-transparent: var(--base) !important;

          --zen-main-browser-background: var(--base) !important;
          --zen-main-browser-background-toolbar: var(--base) !important;

          --zen-urlbar-background: var(--surface) !important;
        }

        #permissions-granted-icon {
          color: #181825 !important;
        }

        .sidebar-placesTree {
          background-color: var(--surface) !important;
        }

        #zen-workspaces-button {
          background-color: var(--base) !important;
        }

        #urlbar-background {
          background-color: var(--surface) !important;
        }

        .tab-background[selected] {
          background: var(--overlay) !important;
        }

        .content-shortcuts {
          background-color: var(--surface) !important;
          border-color: #89b4fa !important;
        }

        .urlbarView-url {
          color: var(--iris) !important;
        }

        #zenEditBookmarkPanelFaviconContainer {
          background: var(--base) !important;
        }

        toolbar .toolbarbutton-1 {
          &:not([disabled]) {
            &:is([open], [checked])
              > :is(
                .toolbarbutton-icon,
                .toolbarbutton-text,
                .toolbarbutton-badge-stack
              ) {
              fill: var(--base);
            }
          }
        }
      '';
    };
  };
}
