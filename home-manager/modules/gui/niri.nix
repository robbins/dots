{
  config,
  pkgs,
  lib,
  specialArgs,
  inputs,
  ...
}:
with lib;
let
  cfg = config.modules.gui.niri;
in
{
  # imports = [ inputs.niri.homeModules.niri ];

  options.modules.gui.niri.enable = mkEnableOption "Niri";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ swaybg ];
    home.sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    programs.niri = {
      settings = {
        window-rules = [
          {
            geometry-corner-radius = let
              radius = 4.0;
            in {
              bottom-left = radius;
              bottom-right = radius;
              top-left = radius;
              top-right = radius;
            };
            clip-to-geometry = true;
          }
        ];
        input = {
          focus-follows-mouse = {
            enable = true;
            max-scroll-amount = "0%";
          };
          warp-mouse-to-focus = true;
          workspace-auto-back-and-forth = true;

          keyboard = {
            repeat-delay = 300;
            repeat-rate = 30;
          };

          touchpad = {
            natural-scroll = true;
          };
        };
        layout = {
          gaps = 10;
          preset-column-widths = [
            { proportion = 1. / 4.; }
            { proportion = 1. / 3.; }
            { proportion = 1. / 2.; }
            { proportion = 2. / 3.; }
          ];
          focus-ring.enable = false;
          border = {
            enable = true;
            width = 1;
            active.gradient = {
              angle = 200;
              from = "#676767";
              to = "#414141";
            };
            inactive.gradient = {
              angle = 315;
              from = "#3B3C3C";
              to = "#3B3C3C";
            };
          };
        };
        binds = with config.lib.niri.actions; {
          "Mod+Return".action = spawn "kitty";
          "Mod+Space".action = spawn "rofi" "-show" "drun";
          "Mod+H".action = focus-column-left;
          "Mod+J".action = focus-window-or-workspace-down;
          "Mod+K".action = focus-window-or-workspace-up;
          "Mod+L".action = focus-column-right;
          "Mod+Ctrl+H".action = focus-monitor-left;
          "Mod+Ctrl+L".action = focus-monitor-right;
          "Mod+Equal".action = set-column-width "+10%";
          "Mod+Minus".action = set-column-width "-10%";
          "Mod+Q".action = close-window;
          "Mod+Shift+H".action = move-column-left;
          "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
          "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
          "Mod+Shift+L".action = move-column-right;
          "Mod+Shift+Ctrl+H".action = move-window-to-monitor-left;
          "Mod+Shift+Ctrl+L".action = move-window-to-monitor-right;
          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;
          "Mod+Page_Down".action = focus-workspace-down;
          "Mod+Page_Up".action = focus-workspace-up;
          "Mod+F".action = maximize-column;
        } // (builtins.listToAttrs (map (num: { name = "Mod+${toString num}"; value.action.focus-workspace = num; }) (lib.lists.range 1 9)));
        outputs = {
          "eDP-1" = {
            mode = {
              width = 1920;
              height = 1080;
              refresh = 143.981;
            };
            variable-refresh-rate = true;
            scale = 1.;
          };
          "DP-3" = {
            mode = {
              width = 3840;
              height = 2160;
              refresh = 120.000;
            };
            position = {
              x = 0;
              y = 0;
            };
            variable-refresh-rate = false;
            scale = 1.;
          };
          "DP-4" = {
            mode = {
              width = 3840;
              height = 2160;
              refresh = 143.963;
            };
            position = {
              x = 0;
              y = 0;
            };
            variable-refresh-rate = false;
            scale = 1.;
          };
          "HDMI-A-2" = {
            mode = {
              width = 1920;
              height = 1080;
              refresh = 72.;
            };
            position = {
              x = 3840;
              y = 0;
            };
            transform.rotation = 270;
          };
          "HDMI-A-1" = {
            mode = {
              width = 3840;
              height = 2160;
              refresh = 72.;
            };
            position = {
              x = 3840;
              y = 0;
            };
            transform.rotation = 0;
          };
        };
        prefer-no-csd = true;
        spawn-at-startup = [
          {
            command = [
              "swaybg"
              "-i"
              "/home/nate/pictures/wallpapers/apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg"
              "-m"
              "fill"
            ];
          }
          {
            command = [ "waybar" ];
          }
        ];
      };
    };
  };
}
