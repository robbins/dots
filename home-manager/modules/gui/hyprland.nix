{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.gui.hyprland;
in {
  options.modules.gui.hyprland.enable = mkEnableOption "Hyprland";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      swaybg
    ];
    home.sessionVariables = {
      _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on";
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = ''
      # This is an example Hyprland config file.
#
# Refer to the wiki for more information.

#
# Please note not all available settings / options are set here.
# For a full list, see the wiki
#

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=,preferred,auto,auto
monitor=eDP-1,1920x1080@144,0x0,1
monitor=HDMI-A-1,1920x1080@74,1920x0,1,transform,3


# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
exec-once = swaybg -i /home/nate/pictures/wallpapers/apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg -m fill & swayidle -w timeout 5 '$lockCmd'

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    repeat_rate=30
    repeat_delay=300

    touchpad {
        natural_scroll = yes
	disable_while_typing = false
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 8
    border_size = 1
    col.active_border = rgba(4d4f58ff) rgba(4d4f58ff) 45deg
    col.inactive_border = rgba(303239ff)

    layout = dwindle
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 5
    blur = no
    blur_size = 5 #7
    blur_passes = 4 #3
    blur_new_optimizations = on

    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = true
    workspace_swipe_forever = true 
    workspace_swipe_numbered = false
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:epic mouse V1 {
    sensitivity = -0.5
}

misc {
    vfr = true
    mouse_move_enables_dpms = true
    disable_hyprland_logo = true
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Return, exec, kitty-run
bind = $mainMod, Q, killactive, 
bind = $mainMod, M, exit, 
bind = $mainMod, E, exec, dolphin
bind = $mainMod, V, togglefloating, 
#bind = $mainMod, R, exec, wofi --show drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, T, togglesplit, # dwindle
bind = $mainMod, F, fullscreen

#Screen lock
bind = $mainMod, grave, exec, swaylock -i /home/nate/Pictures/Wallpapers/2022-MacBook-Air-wallpaper-blue-dark.jpeg --font "SF Pro Display" --scaling fill --indicator --clock --datestr "%A %b %d, %Y" --timestr "%I:%M %p" --text-color FFFFFF --ring-color CCCCCC00 --inside-color 22222299 --indicator-radius 175 --key-hl-color EEEEEE55 -n --separator-color 00000000 --indicator-thickness 20 -r --inside-clear-color FFFFFF22 --ring-clear-color BBEEFF --inside-ver-color FFFFFF22 --ring-ver-color BBEEFF

bindl=,switch:on:Lid Switch,exec,swaylock -i /home/nate/Pictures/Wallpapers/2022-MacBook-Air-wallpaper-blue-dark.jpeg --font "SF Pro Display" --scaling fill --indicator --clock --datestr "%A %b %d, %Y" --timestr "%I:%M %p" --text-color FFFFFF --ring-color CCCCCC00 --inside-color 22222299 --indicator-radius 175 --key-hl-color EEEEEE55 -n --separator-color 00000000 --indicator-thickness 20 -r --inside-clear-color FFFFFF22 --ring-clear-color BBEEFF --inside-ver-color FFFFFF22 --ring-ver-color BBEEFF

bindl=,switch:on:Lid Switch,exec,sleep 1 && hyprctl dispatch dpms off HDMI-A-1
bindl=,switch:off:Lid Switch,exec,sleep 1 && hyprctl dispatch dpms on HDMI-A-1

$lockCmd = swaylock -i /home/nate/Pictures/Wallpapers/2022-MacBook-Air-wallpaper-blue-dark.jpeg --font "SF Pro Display" --scaling fill --indicator --clock --datestr "%A %b %d, %Y" --timestr "%I:%M %p" --text-color FFFFFF --ring-color CCCCCC00 --inside-color 22222299 --indicator-radius 175 --key-hl-color EEEEEE55 -n --separator-color 00000000 --indicator-thickness 20 -r --inside-clear-color FFFFFF22 --ring-clear-color BBEEFF --inside-ver-color FFFFFF22 --ring-ver-color BBEEFF

#Launcher
bind = $mainMod, space, exec, j4-dmenu-desktop --no-generic --dmenu 'bemenu -i -n -H 1 --scrollbar autohide --ff "##ebdbb2" --scb "##ebdbb2" --scf "##1d2021" --tb "##665c54" --nb "##222222" --nf "##ebdbb2" --fb "##1d2021" --tf "##ebdbb2" --hb "##665c54" --hf "##ebdbb2" --sb "##ebdbb2" --sf "##ebdbb2" --ab "##222222" --af "##ebdbb2" --fn "PragmataPro Mono Liga"' --term='kitty'

#Volume
binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+
binde=, XF86AudioLowerVolume, exec, wpctl set-volume -l 0.0 @DEFAULT_SINK@ 5%-
binde=, XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

#Keyboard brightness
bind = ,XF86KbdBrightnessDown,exec, asusctl -p
bind = ,XF86KbdBrightnessUp,exec, asusctl -n

#Display brightness
binde = ,XF86MonBrightnessUp, exec, echo "$(cur=$(($(cat /sys/class/backlight/amdgpu_bl0/brightness) + 15)) ; echo $(($cur >= 255 ? 255 : $cur)))" | tee /sys/class/backlight/amdgpu_bl0/brightness
binde = ,XF86MonBrightnessDown, exec, echo "$(cur=$(($(cat /sys/class/backlight/amdgpu_bl0/brightness) - 15)) ; echo $(($cur <= 0 ? 0 : $cur)))" | tee /sys/class/backlight/amdgpu_bl0/brightness

#Screenshot
bind = ,Print, exec, grimblast copysave area ~/pictures/screenshots/"Screenshot_"$(date +%F_%I_%m_%M)

# Move focus with mainMod + arrow keys
bind = $mainMod, h, movefocus, l
bind = $mainMod, l, movefocus, r
bind = $mainMod, k, movefocus, u
bind = $mainMod, j, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = ALT, 1, movetoworkspace, 1
bind = ALT, 2, movetoworkspace, 2
bind = ALT, 3, movetoworkspace, 3
bind = ALT, 4, movetoworkspace, 4
bind = ALT, 5, movetoworkspace, 5
bind = ALT, 6, movetoworkspace, 6
bind = ALT, 7, movetoworkspace, 7
bind = ALT, 8, movetoworkspace, 8
bind = ALT, 9, movetoworkspace, 9
bind = ALT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Sets workspaces 1-5 on laptop, 6-0 on vertical display
wsbind=1,eDP-1
wsbind=2,eDP-1
wsbind=3,eDP-1
wsbind=4,eDP-1
wsbind=5,eDP-1
wsbind=6,HDMI-A-1
wsbind=7,HDMI-A-1
wsbind=8,HDMI-A-1
wsbind=9,HDMI-A-1
wsbind=0,HDMI-A-1

      '';
    };
  };
}
