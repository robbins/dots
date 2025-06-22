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
        bookmarks = {
          force = true;
          settings = [{
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
          }];
        };
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          darkreader
          ublock-origin
          sponsorblock
          surfingkeys
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
        '';
      };
    };
  };
}
