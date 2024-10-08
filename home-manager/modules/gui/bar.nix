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
    windowHorizontalPadding = lib.mkOption { default = "20px"; };
    modulePadding = lib.mkOption { default = "15px"; };
    leftEdgePadding = lib.mkOption { default = "20px"; };
    rightEdgePadding = lib.mkOption { default = "15px"; };
    extraConfig = lib.mkOption { default = ""; };
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      style = (
        import ./_bar.css.nix {
          inherit (cfg)
            fontSize
            workspaceMargin
            windowHorizontalPadding
            modulePadding
            leftEdgePadding
            rightEdgePadding
            extraConfig
            ;
        }
      );
      enable = true;
      settings = [
        {
          layer = "top";
          height = cfg.barHeight;
          reload_style_on_change = true;
          spacing = 0;
          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [
            "battery"
            "network#wired"
            "network#wireless"
          ];
          "network#wireless" = {
            interface = "wlan0";
            format = "{icon}";
            format-icons = [
              "󰤨"
              "󰤥"
              "󰤢"
              "󰤟"
              "󰤯"
            ];
            tooltip-format = "{essid} {ipaddr} on {ifname} at {frequency} via {gwaddr}";
            on-click = "kitty --hold zsh -c 'ip a show dev wlan0'";
          };
          "network#wired" = {
            interface = "enp10s0";
            format = "";
            tooltip-format = "{ipaddr}/{cidr} on {ifname} at {bandwidthDownBytes} via {gwaddr}";
            on-click = "kitty --hold zsh -c 'ip a show dev enp10s0'";
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
            format = "􀊫";
            on-click = "rofi -show drun";
          };
          "hyprland/workspaces" = {
            disable-scroll = false;
            format = "{name}";
            persistent-workspaces =
              {
              };
          };
          "battery" = {
            format = "{capacity}%{icon} ";
            format-icons = [
              "󰂃"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            format-charging = "{capacity}%󰂄";
            format-discharging = "{capacity}% {icon}";
            format-plugged = "󱈑{capacity}%";
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
