{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.gui.wayland;
in {
  options.modules.gui.wayland = { 
    enable = lib.mkEnableOption "Wayland"; 
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wl-clipboard
      slurp
      grim
      xdg-desktop-portal 
   ];
  };
}
