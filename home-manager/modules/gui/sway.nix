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
        modifier = "Mod4";
        terminal = "kitty-run";
      };
    };
  };
}
