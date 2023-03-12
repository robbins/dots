{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.gui.hyprland;
in {
  options.modules.gui.hyprland.enable = mkEnableOption "Hyprland";
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.enable = true;
  };
}
