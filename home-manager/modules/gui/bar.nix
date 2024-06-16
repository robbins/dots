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
    barHeight = lib.mkOption { default = 32; };
    fontSize = lib.mkOption { default = "20px"; };
    workspaceMargin = lib.mkOption { default = "6px"; };
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      style = (import ./_bar.css.nix { inherit (cfg) fontSize workspaceMargin; });
      enable = true;
      settings = [
        {
          layer = "top";
          height = cfg.barHeight;
          reload_style_on_change = true;
          spacing = 0;
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
              "􀛪"
              "􀛩"
              "􀛨"
            ];
            format-charging = "􀢋{capacity}% {time}";
            format-discharging = "{icon} {capacity}% {time}";
            format-plugged = "􀡸 {capacity}%";
            format-alt = "󰊚{power}";
          };
          "hyprland/window" = {
            separate-outputs = true;
            rewrite = {
              "(.*Obsidian.*)" = "Obsidian";
              "(.*) - Chromium" = "Chromium";
              "^(?!.*Firefox).*(\\/[^\\/\\s]+)+" = "Terminal";
              "(.*) — Firefox Nightly" = "Firefox Nightly";
              "(.*vim.*)" = "Terminal";
              "(.*~.*)" = "Terminal";
            };
          };
        }
     ];
  };
};
}
