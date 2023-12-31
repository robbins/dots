{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.gui.hyprland;
in {
  options.modules.gui.hyprland.enable = mkEnableOption "Hyprland";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      swaybg
    ];
    home.sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
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
				monitor=HDMI-A-1,1920x1080@74,0x0,1
				monitor=eDP-1,1920x1080@144,0x1080,1
				
				# See https://wiki.hyprland.org/Configuring/Keywords/ for more
				
				# Execute your favorite apps at launch
				exec-once = swaybg -i ~/pictures/wallpapers/apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg -m fill & waybar
				
				# Source a file (multi-file configs)
				# source = ~/.config/hypr/myColors.conf
				
				# Some default env vars.
				env = XCURSOR_SIZE,24
				
				# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
				input {
				    kb_layout = us
				    kb_variant =
				    kb_model =
				    kb_options =
				    kb_rules =
				
				    follow_mouse = 1
				
				    repeat_rate = 30
				    repeat_delay = 300
				
				    touchpad {
				        natural_scroll = true
				    }
				
				    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
				}
				
				general {
				    # See https://wiki.hyprland.org/Configuring/Variables/ for more
				
				    gaps_in = 3
				    gaps_out = 10
				    border_size = 1
				    col.active_border = rgba(4c4c4eff) rgba(3b3c3cff) 80deg
				    col.inactive_border = rgba(3b3c3cff)
				
				    layout = dwindle
				
				    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
				    allow_tearing = false
				}
				
				decoration {
				    # See https://wiki.hyprland.org/Configuring/Variables/ for more
				
				    rounding = 3
				
				    blur {
				        enabled = false
				        size = 3
				        passes = 1
				        
				        vibrancy = 0.1696
				    }
				
				    drop_shadow = true
				    shadow_range = 4
				    shadow_render_power = 3
				    col.shadow = rgba(1a1a1aee)
				}
				
				animations {
				    enabled = true
				
				    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
				
				    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
				
				    animation = windows, 1, 1, myBezier
				    animation = windowsOut, 1, 7, default, popin 80%
				    animation = border, 1, 10, default
				    animation = borderangle, 1, 8, default
				    animation = fade, 1, 7, default
				    animation = workspaces, 1, 1, default
				}
				
				dwindle {
				    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
				    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
				    preserve_split = true # you probably want this
				}
				
				master {
				    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
				    new_is_master = true
				}
				
				gestures {
				    # See https://wiki.hyprland.org/Configuring/Variables/ for more
				    workspace_swipe = true
				}
				
				misc {
				    # See https://wiki.hyprland.org/Configuring/Variables/ for more
                                    disable_hyprland_logo = true
                                    force_default_wallpaper = 0
				}
				
				# Example per-device config
				# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
				device:epic-mouse-v1 {
				    sensitivity = -0.5
				}
				
				# Example windowrule v1
				# windowrule = float, ^(kitty)$
				# Example windowrule v2
				# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
				# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
				
				
				# See https://wiki.hyprland.org/Configuring/Keywords/ for more
				$mainMod = SUPER
				
				bind=SUPERSHIFT,asciitilde,movetoworkspace,special
				bind=SUPER,grave,togglespecialworkspace,HDMI-A-1
				
				# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
				bindr =SUPER, SUPER_L, exec, pkill --signal SIGUSR1 waybar
				
				bind = $mainMod, Return, exec, kitty-run
				bind = $mainMod, Q, killactive,
				bind = $mainMod, M, exit,
				bind = $mainMod, V, togglefloating,
				bind = $mainMod, Space, exec, rofi -show drun
				bind = $mainMod, P, pseudo, # dwindle
				bind = $mainMod, S, togglesplit, # dwindle
				
				# Move focus with mainMod + vim keybinds
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
				bind = $mainMod SHIFT, 1, movetoworkspace, 1
				bind = $mainMod SHIFT, 2, movetoworkspace, 2
				bind = $mainMod SHIFT, 3, movetoworkspace, 3
				bind = $mainMod SHIFT, 4, movetoworkspace, 4
				bind = $mainMod SHIFT, 5, movetoworkspace, 5
				bind = $mainMod SHIFT, 6, movetoworkspace, 6
				bind = $mainMod SHIFT, 7, movetoworkspace, 7
				bind = $mainMod SHIFT, 8, movetoworkspace, 8
				bind = $mainMod SHIFT, 9, movetoworkspace, 9
				bind = $mainMod SHIFT, 0, movetoworkspace, 10
				
				# Example special workspace (scratchpad)
				#bind = $mainMod, S, togglespecialworkspace, magic
				#bind = $mainMod SHIFT, S, movetoworkspace, special:magic
				
				# Scroll through existing workspaces with mainMod + scroll
				bind = $mainMod, mouse_down, workspace, e+1
				bind = $mainMod, mouse_up, workspace, e-1
				
				# Move/resize windows with mainMod + LMB/RMB and dragging
				bindm = $mainMod, mouse:272, movewindow
				bindm = $mainMod, mouse:273, resizewindow
				
				binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+
				binde=, XF86AudioLowerVolume, exec, wpctl set-volume -l 0.0 @DEFAULT_SINK@ 5%-
				binde=, XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

				binde=, F2, exec, asusctl -p
				binde=, F3, exec, asusctl -n

				binde=, F7, exec, echo $(( $(cat /sys/class/backlight/amdgpu_bl0/brightness) - 10 < 0 ? 0 : $(cat /sys/class/backlight/amdgpu_bl0/brightness) - 10 )) | tee /sys/class/backlight/amdgpu_bl0/brightness >/dev/null
				binde=, F8, exec, echo $(( $(cat /sys/class/backlight/amdgpu_bl0/brightness) + 10 > 255 ? 255 : $(cat /sys/class/backlight/amdgpu_bl0/brightness) + 10 )) | tee /sys/class/backlight/amdgpu_bl0/brightness >/dev/null

                                bind = $mainMod, L, exec, swaylock -i /home/${specialArgs.username}/pictures/wallpapers/apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg -s fill --clock --timestr '%I:%M:%S %p' --datestr '%F' --indicator --indicator-radius 120 --indicator-thickness 12 --text-color EBDBB2 --text-clear-color EBDBB2 --text-caps-lock-color EBDBB2 --text-ver-color EBDBB2 --text-wrong-color EBDBB2 --inside-color 00000055 --line-color 282828 --ring-color EBDBB2 --separator-color EBDBB2 --bs-hl-color FB4934 --key-hl-color B8BB26 --line-clear-color FABD2F --inside-clear-color 00000066 --ring-clear-color FABD2F --ring-ver-color 458588 --inside-ver-color 00000066 --ring-wrong-color FB4934 --inside-wrong-color 00000066 --font-size 30 -r --grace 3
      '';
    };
  };
}
