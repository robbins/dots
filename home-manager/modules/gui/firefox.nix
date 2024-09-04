{
  config,
  osConfig ? { },
  pkgs,
  lib,
  inputs,
  specialArgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.gui.firefox;
in
{
  options.modules.gui.firefox = {
    enable = mkEnableOption "Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin;
      policies = {
        # Privacy
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DNSOverHTTPS = true;

        DontCheckDefaultBrowser = true;
        OfferToSaveLogins = false;
      };
      profiles.default = {
        bookmarks = [
          {
            toolbar = true;
            bookmarks = [
              {
                name = "Nix Sites";
                bookmarks = [
                  {
                    name = "Dotfiles";
                    url = "https://github.com/robbins/dots";
                  }
                  {
                    name = "Nixpkgs";
                    url = "github.com/NixOS/nixpkgs";
                  }
                  {
                    name = "Home-Manager";
                    url = "https://github.com/nix-community/home-manager";
                  }
                  {
                    name = "Noogle";
                    url = "https://noogle.dev";
                  }
                  {
                    name = "NixOS Wiki";
                    url = "https://wiki.nixos.org";
                  }
                  {
                    name = "NixOS Manual";
                    url = "https://nixos.org/manual/nix/unstable";
                  }
                  {
                    name = "Nixpkgs Manual";
                    url = "https://nixos.org/manual/nixpkgs/unstable";
                  }
                  {
                    name = "NixOS & Flakes Book";
                    url = "https://nixos-and-flakes.thiscute.world/preface";
                  }
                ];
              }
              {
                name = "UofT";
                bookmarks = [
                  {
                    name = "Piazza";
                    url = "https://piazza.com/class";
                  }
                  {
                    name = "Quercus";
                    url = "https://q.utoronto.ca";
                  }
                  {
                    name = "Acorn";
                    url = "https://acorn.utoronto.ca";
                  }
                ];
              }
              {
                name = "Android";
                bookmarks = [
                  {
                    name = "Android API Reference";
                    url = "https://developer.android.com/reference/kotlin/packages";
                  }
                  {
                    name = "Jetpack Compose Reference";
                    url = "https://developer.android.com/reference/kotlin/androidx/compose/runtime/package-summary";
                  }
                  {
                    name = "AndroidX Reference";
                    url = "https://developer.android.com/reference/kotlin/androidx/packages";
                  }
                  {
                    name = "Developer Tools Issue Tracker";
                    url = "https://issuetracker.google.com/issues?q=componentid:192633%2B";
                  }
                ];
              }
              {
                name = "AOSP";
                bookmarks = [
                  {
                    name = "Code Search";
                    url = "https://cs.android.com/android/platform/superproject/main";
                  }
                  {
                    name = "API Reference";
                    url = "https://source.android.com/reference";
                  }
                  {
                    name = "Documentation";
                    url = "https://source.android.com/docs/core";
                  }
                  {
                    name = "Gerrit";
                    url = "https://android-review.googlesource.com/";
                  }
                  {
                    name = "Java Code Style";
                    url = "https://source.android.com/docs/setup/contribute/code-style";
                  }
                  {
                    name = "Platform Issue Tracker";
                    url = "https://issuetracker.google.com/issues?q=componentid:(192786%20%7C%20192805%20%7C%20192705%20%7C%20192792%20%7C%20192644%20%7C%20192694%20%7C%20192710%20%7C%20192810%20%7C%20192634%20%7C%20192698%20%7C%20192706%20%7C%20470386%20%7C%20192815%20%7C%20192715%20%7C%20192720%20%7C%20192711%20%7C%20192629%20%7C%20192643%20%7C%20192693%20%7C%20192639)";
                  }
                ];
              }
            ];
          }
        ];
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          darkreader
          ublock-origin
          sponsorblock
          surfingkeys
          tree-style-tab
          gruvbox-dark-theme
          omnivore
        ];
        settings = {
          "browser.aboutConfig.showWarning" = false;
          "browser.compactmode.show" = true;

          # Allow custom userChrome stylesheets
          "toolkit.legacyUserProfileCustomizations" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          # Disable Pocket Integration
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "extensions.pocket.enabled" = false;
          "extensions.pocket.api" = "";
          "extensions.pocket.oAuthConsumerKey" = "";
          "extensions.pocket.showHome" = false;
          "extensions.pocket.site" = "";
        };
        search = {
          force = true;
          default = "Google";
          order = [
            "Google"
            "DuckDuckGo"
          ];
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "NixOS Modules" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "type";
                      value = "options";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
          };
        };
        userChrome = ''
          #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
            opacity: 0;
            pointer-events: none;
          }
          #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
              visibility: collapse !important;
          }

          #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
            display: none;
          }

          /*
              Display the status bar in Firefox Quantum (version 61+)
              permanently at the bottom of the browser window.
              Code below works best for the Dark Firefox theme and is based on:
              https://github.com/MatMoul/firefox-gui-chrome-css/blob/master/chrome/userChrome.css
              This userChrome.css file was last modified on: 28-Jun-2018.
              Tested to work with Firefox 61 on Windows.
              Related blog post: http://www.optimiced.com/en/?p=1727
          */

          #browser-bottombox {
            height: 20px;
            border-top: solid 1px #505050;
          }

          .browserContainer>#statuspanel {
            left: 4px !important;
            bottom: 0px;
            transition-duration: 0s !important;
            transition-delay: 0s !important;
          }

          .browserContainer>#statuspanel>#statuspanel-inner>#statuspanel-label {
            margin-left: 0px !important;
            border: none !important;
            padding: 0px !important;
            color: #EEE !important;
            background: #333 !important;
          }

          window[inFullscreen="true"] #browser-bottombox {
            display: none !important;
          }

          window[inFullscreen="true"] .browserContainer>#statuspanel[type="overLink"] #statuspanel-label {
            display: none !important;
          }

          #titlebar {
            appearance: none !important;
            height: 0px;
          }

          #titlebar > #toolbar-menubar {
            margin-top: 0px;
          }

          #TabsToolbar {
            min-width: 0 !important;
            min-height: 0 !important;
          }

          #TabsToolbar > .titlebar-buttonbox-container {
            display: block;
            position: absolute;
            top: 12px;
            left: 0px;
          }

          #nav-bar toolbarspring {
            min-width: 10px !important;
            max-width: 20px !important;
          }


          /* Show sidebar only when the cursor is over it  */
          /* The border controlling sidebar width will be removed so you'll need to modify these values to change width */

          #sidebar-box{
            --uc-sidebar-width: 0px;
            --uc-sidebar-hover-width: 210px;
            --uc-autohide-sidebar-delay: 600ms; /* Wait 0.6s before hiding sidebar */
            --uc-autohide-transition-duration: 115ms;
            --uc-autohide-transition-type: linear;
            position: relative;
            min-width: var(--uc-sidebar-width) !important;
            width: var(--uc-sidebar-width) !important;
            max-width: var(--uc-sidebar-width) !important;
            z-index:1;
          }

          #sidebar-box[positionend]{ direction: rtl }
          #sidebar-box[positionend] > *{ direction: ltr }

          #sidebar-box[positionend]:-moz-locale-dir(rtl){ direction: ltr }
          #sidebar-box[positionend]:-moz-locale-dir(rtl) > *{ direction: rtl }

          #main-window[sizemode="fullscreen"] #sidebar-box{ --uc-sidebar-width: 1px; }

          #sidebar-splitter{ display: none }

          #sidebar-header{
            overflow: hidden;
            color: var(--chrome-color, inherit) !important;
            padding-inline: 0 !important;
          }

          #sidebar-header::before,
          #sidebar-header::after{
            content: "";
            display: flex;
            padding-left: 8px;
          }

          #sidebar-header,
          #sidebar{
            transition: min-width var(--uc-autohide-transition-duration) var(--uc-autohide-transition-type) var(--uc-autohide-sidebar-delay) !important;
            min-width: var(--uc-sidebar-width) !important;
            will-change: min-width;
          }
          #sidebar-box:hover > #sidebar-header,
          #sidebar-box:hover > #sidebar{
            min-width: var(--uc-sidebar-hover-width) !important;
            transition-delay: 0ms !important;
          }

          .sidebar-panel{
            background-color: transparent !important;
            color: var(--newtab-text-primary-color) !important;
          }

          .sidebar-panel #search-box{
            -moz-appearance: none !important;
            background-color: rgba(249,249,250,0.1) !important; 
            color: inherit !important;
          }

          /* Add sidebar divider and give it background */

          #sidebar,
          #sidebar-header{
            background-color: inherit !important;
            border-inline: 1px solid rgb(80,80,80);
            border-inline-width: 0px 1px;
          }

          #sidebar-box:not([positionend]) > :-moz-locale-dir(rtl),
          #sidebar-box[positionend] > *{
            border-inline-width: 1px 0px;
          }

          /* Move statuspanel to the other side when sidebar is hovered so it doesn't get covered by sidebar */

          #sidebar-box:not([positionend]):hover ~ #appcontent #statuspanel{
            inset-inline: auto 0px !important;
          }
          #sidebar-box:not([positionend]):hover ~ #appcontent #statuspanel-label{
            margin-inline: 0px !important;
            border-left-style: solid !important; 
          }
        '';
      };
    };
  };
}
