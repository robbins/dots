{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.gui.bar;
in {
  options.modules.gui.bar = { 
    enable = lib.mkEnableOption "Bar"; 
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      style = ./bar.css;
      enable = true;
      package = (pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ]; }));
      settings = [
        {
          layer = "top";
	  height = 24;
	  modules-left = ["wlr/workspaces" "cpu" "custom/memory" "disk" "disk#root" ];
	  modules-center = ["clock" "custom/weather"];
	  modules-right = ["pulseaudio#mic" "pulseaudio#speaker" "network" "custom/powerprofile" "backlight" "battery" ];
	"battery" = {
            format = "{capacity}% {icon}";
            format-icons = ["" "" "" "" ""];
            format-charging = "{icon} {capacity}%  {time}";
            format-discharging = "{icon} {capacity}% {time}";
            format-plugged = "  {capacity}%";
            format-alt = "{power}";
            interval = 60;
          };
	  "pulseaudio#speaker" = {
            format = "{icon} {volume}%";
            format-muted = " {volume}%";
            format-bluetooth = "{icon} {volume}% {desc}";
            format-bluetooth-muted = "  {volume}% {desc}";
            headphone = "";
            format-icons = {
              default = ["" "" ""];
            };
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
            on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          };
          "pulseaudio#mic" = {
            format = "{format_source}";
            format-muted = "{format_source_muted}";
            format-source = "";
            format-source-muted = "";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            on-scroll-up = "";
            on-scroll-down = "";
          };
          "backlight" = {
            format = "{percent}% {icon}";
            format-icons = ["" "" "" "" "" "" "" "" ""];
            on-scroll-up = "";
            on-scroll-down = "";
          };
	  "cpu" = {
            format = "{usage}%  ";
            interval = 5;
          };
          "custom/memory" = {
            format = ''{}GB<span font='Font Awesome 6 Free' size='small' > </span>'';
            interval = 2;
            exec = "awk '/^Mem/ {print $3}' <(free -h) | rev | cut -c3- | rev";
          };
          "disk" = {
            format = "{percentage_used}% <span font='Font Awesome 6 Free Solid' size='small'></span>";
            "interval" = 60;
            "path" = "/persist";
          };
          "disk#root" = {
            "format" = "{percentage_used}% ";
            "interval" = 60;
            "path" = "/";
          };
          "network" = {
            format-wifi = " {essid} {signalStrength}%";
            format-ethernet = "<span font='Font Awesome 6 Free Solid' size='small'></span>";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "睊Not connected";
            format-alt = "{ifname}: {ipaddr} {frequency}GHz";
          };
          "clock" = {
            interval = 60;
            format-alt = "{:%A; %B %d %Y }";
            format = "{:%a %b %d %I:%M %p}";
          };
	  }
      ];
    };
  };
}