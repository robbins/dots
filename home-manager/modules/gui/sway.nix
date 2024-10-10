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
  cfg = config.modules.gui.sway;
in
{
  options.modules.gui.sway.enable = mkEnableOption "SwayWM";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ swaybg ];
    home.sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
    wayland.windowManager.sway = {
      enable = true;
      config = rec {
        modifier = "Mod1";
        terminal = "kitty-run";
        output = {
          DP-1 = {
            pos = "0,0";
            mode = "3840x2160@144Hz";
          };
          HEADLESS-1 = {
            pos = "-1920,0";
            mode = "3840x2160@144Hz";
          };
        };
      };
    };
  };
}
