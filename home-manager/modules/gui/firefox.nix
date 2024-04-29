{
  config,
  osConfig ? { },
  pkgs,
  lib,
  inputs,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.gui.firefox;
in
{
  options.modules.gui.firefox = {
    enable = mkEnableOption "Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin.override {
        extraPolicies = {
          # Privacy
          EnableTrackingProtection = {
            Value= true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
          DisablePocket = true;
          DontCheckDefaultBrowser = true;
          DisableFirefoxAccounts = true;
          DNSOverHTTPS = true;
          OfferToSaveLogins = false;
        };
      };
      profiles.default = {
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          darkreader
          ublock-origin
          sponsorblock
          surfingkeys
          tree-style-tab
          gruvbox-dark-theme
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
          order = [ "Google" "DuckDuckGo" ];
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "NixOS Modules" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "type"; value = "options"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
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
        '';
      };
    };
  };
}
