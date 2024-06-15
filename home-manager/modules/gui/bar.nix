{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.modules.gui.bar;
in
{
  options.modules.gui.bar = {
    enable = lib.mkEnableOption "Bar";
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      style = ./bar.css;
      enable = true;
      settings = [
        {
          layer = "top";
          height = 47;
          reload_style_on_change = true;
          modules-left = [ "custom/logo" "hyprland/window" "hyprland/workspaces" ];
          modules-center = [ "" ];
          modules-right = [
            "clock"
          ];
          "clock" = {
            interval = 60;
            format = "{:%a %b %d  %I:%M %p}";
          };
          "hyprland/window" = {
            separate-outputs = true;
            max-length = 200;
          };
          "custom/logo" = {
            format = "";
          };
          "hyprland/workspaces" = {
            disable-scroll = false;
            format = "{name}";
            persistent-workspaces = {
            };
          };
        }
      ];
    };
  };
}
