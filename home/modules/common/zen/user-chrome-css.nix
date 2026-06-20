{
  lib,
  config,
  ...
}: {
  options = {
    zen.userChromeCSS.enable =
      lib.mkEnableOption "user-chrome-css";
  };
  config = lib.mkIf config.zen.userChromeCSS.enable {
    programs.zen-browser.profiles."${config.zen.profile}" = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "zen.themes.disable-all" = false;
      };
      userChrome = ''
        /* ---------- Rosé Pine Moon Color Scheme (this is Vibe-coded because it was broken before) */
        *{
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

        /* ---------- SuperPins (v1.7.0) CSS because otherwise its not declaratively */

        /* ----- Keep pinned tabs at the top when scrolling */
        zen-workspace > arrowscrollbox.workspace-arrowscrollbox {
          overflow-y: hidden !important;
          flex-basis: 100%;
        }

        #tabbrowser-arrowscrollbox .zen-workspace-pinned-tabs-section {
          flex: 0 1 0;
        }

        #tabbrowser-arrowscrollbox .zen-workspace-normal-tabs-section {
          flex: 1 1 0;
          overflow-y: auto !important;
          margin-bottom: 5px;
        }

        /* ----- Removes the sidebar scrollbar */
        scrollbox:nth-child(5),
        #tabbrowser-arrowscrollbox .zen-workspace-normal-tabs-section {
          scrollbar-width: none !important;
        }

        /* ----- Display seperators when there are essentials and/or pinned tabs */
        zen-workspace[active="true"]:has(.zen-workspace-pinned-tabs-section .tabbrowser-tab) {
          &:has(
          ~ #zen-tabs-wrapper
            #zen-browser-tabs-container
            #vertical-pinned-tabs-container
            .zen-workspace-tabs-section[active="true"]
            .tabbrowser-tab
          ) {
            margin-top: 6px !important;
          }
        }

        .zen-essentials-container {
          &:has(> :nth-child(1)) ~ #zen-tabs-wrapper .zen-workspace-pinned-tabs-section {
            min-height: 20px !important;
          }
        }

        .zen-essentials-container {
          &:has(> :nth-child(1)) ~ #zen-tabs-wrapper .zen-workspace-pinned-tabs-section {
            .pinned-tabs-container-separator {
              max-height: unset !important;
            }
          }
        }
        /* ---------- Custom CSS */

        /* ----- Remove close Tab button */
        .tabbrowser-tab .tab-close-button {
          visibility: collapse !important;
        }

      '';
    };
  };
}
