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
          height = 32;
          reload_style_on_change = true;
          spacing = 20;
          modules-left = [ "custom/logo" "hyprland/window" "hyprland/workspaces" ];
          modules-center = [ ];
          modules-right = [
            "battery"
            "network#wired"
            "network#wireless"
            "custom/search"
            "clock"
          ];
          "network#wireless" = {
            interface = "wlan0";
            format = "{icon}";
            format-icons = [
              "󰖩"
            ];
            tooltip-format = "{essid} {ipaddr} on {ifname} at {frequency} via {gwaddr}";
            on-click = "kitty --hold zsh -c 'ip a show dev wlan0'";
          };
          "network#wired" = {
            interface = "enp11s0";
            format = "󰈀";
            tooltip-format = "{ipaddr}/{cidr} on {ifname} at {bandwidthDownBytes} via {gwaddr}";
            on-click = "kitty --hold zsh -c 'ip a show dev enp11s0'";
          };
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
            on-click = "kitty --hold zsh -c 'fastfetch'";
          };
          "custom/search" = {
            format = "";
            on-click = "rofi -show drun";
          };
          "hyprland/workspaces" = {
            disable-scroll = false;
            format = "{name}";
            persistent-workspaces = {
            };
          };
          "battery" = {
            format = "{capacity}% {icon}";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
            format-charging = "{capacity}% {time}";
            format-discharging = "{icon} {capacity}% {time}";
            format-plugged = " {capacity}%";
            format-alt = "󰊚{power}";
          };
        }
     ];
  };
};
}
