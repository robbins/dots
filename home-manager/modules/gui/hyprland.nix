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
  cfg = config.modules.gui.hyprland;
in
{
  options.modules.gui.hyprland.enable = mkEnableOption "Hyprland";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ swaybg ];
    home.sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      plugins = [
        inputs.hyprscroller.packages.${pkgs.system}.default
        inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      ];
      extraConfig = ''
        plugin {
          hyprbars {
            bar_height = 13
            bar_color = rgba(000000ff)
            bar_text_font = "PragmataPro Mono Liga Regular"
            bar_text_align = left
            bar_part_of_window = true
            bar_padding = 0
          }
        }
        # Change bar color on focused window
        windowrulev2 = plugin:hyprbars:bar_color rgba(5e5e5eff), ^focus:1
        	# This is an example Hyprland config file.
        	#
        	# Refer to the wiki for more information.
        	
        	#
        	# Please note not all available settings / options are set here.
        	# For a full list, see the wiki
        	#

                # opengl {
                #   force_introspection = true
                # }

        	# See https://wiki.hyprland.org/Configuring/Monitors/
        	monitor=DP-4,3840x2160@144,0x0,1.00,bitdepth,10
                monitor=HDMI-A-2,1920x1080@74,3840x0,1,transform,3
        	monitor=eDP-1,1920x1080@144,0x0,1
        	monitor=,preferred,auto,auto
        	
        	# See https://wiki.hyprland.org/Configuring/Keywords/ for more
        	
        	# Execute your favorite apps at launch
                # wp-notifyd and brightness-libnotify currently only locally installed TODO
        	exec-once = swaybg -i ~/pictures/wallpapers/15-Sequioia-Light.jpg & waybar & wp-notifyd & brightness-libnotify
        	
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
        	    gaps_out = 17,5,5,5 
        	    border_size = 1
        	    col.active_border = rgba(4c4c4eff) rgba(3b3c3cff) 80deg
        	    col.inactive_border = rgba(3b3c3cff)
        	
        	    layout = scroller
        	
        	    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        	    allow_tearing = false
        	}
        	
        	decoration {
        	    # See https://wiki.hyprland.org/Configuring/Variables/ for more
        	
        	    rounding = 3
        	
        	    blur {
        	        enabled = true 
        	        size = 3
        	        passes = 7
                        noise = 0.0117
                        contrast = 0.8916
                        # 0.8172
                        brightness = 1
                        vibrancy = 0.1696
                        vibrancy_darkness = 0
                        popups = false
        	    }
                    layerrule = blur,waybar
                    layerrule=xray 1, ^(bar)$
        	
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
        	}
        	
        	gestures {
        	    # See https://wiki.hyprland.org/Configuring/Variables/ for more
        	    workspace_swipe = true
        	}
        	
        	misc {
        	    # See https://wiki.hyprland.org/Configuring/Variables/ for more
                    disable_hyprland_logo = true
                    force_default_wallpaper = 0
                    mouse_move_enables_dpms = true
                    key_press_enables_dpms = true
                    vfr = true
                    vrr = 1
        	}
        	
        	# Example per-device config
        	# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
                # device:epic-mouse-v1 {
        	#     sensitivity = -0.5
        	# }
        	
        	# Example windowrule v1
        	# windowrule = float, ^(kitty)$
        	# Example windowrule v2
        	# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
        	# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        	
        	
        	# See https://wiki.hyprland.org/Configuring/Keywords/ for more
        	$mainMod = SUPER
        	
        	bind=SUPERSHIFT,asciitilde,movetoworkspace,special:scratchpad
        	bind=SUPER,grave,togglespecialworkspace,scratchpad,HDMI-A-1
        	
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
        	bind = $mainMod, h, scroller:movefocus, l
        	bind = $mainMod, l, scroller:movefocus, r
        	bind = $mainMod, k, scroller:movefocus, u
        	bind = $mainMod, j, scroller:movefocus, d

        	bind = $mainMod SHIFT, h, scroller:movewindow, l
        	bind = $mainMod SHIFT, l, scroller:movewindow, r
        	bind = $mainMod SHIFT, k, scroller:movewindow, u
        	bind = $mainMod SHIFT, j, scroller:movewindow, d
        	
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

                bind = $mainMod, F, fullscreen, 0
        	
        	binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+
        	binde=, XF86AudioLowerVolume, exec, wpctl set-volume -l 0.0 @DEFAULT_SINK@ 5%-
        	binde=, XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

        	binde=, XF86KbdBrightnessDown, exec, asusctl -p
        	binde=, XF86KbdBrightnessUp, exec, asusctl -n

        	binde=, XF86MonBrightnessDown, exec, echo $(( $(cat /sys/class/backlight/amdgpu_bl1/brightness) - 10 < 0 ? 0 : $(cat /sys/class/backlight/amdgpu_bl1/brightness) - 10 )) | tee /sys/class/backlight/amdgpu_bl1/brightness >/dev/null
        	binde=, XF86MonBrightnessUp, exec, echo $(( $(cat /sys/class/backlight/amdgpu_bl1/brightness) + 10 > 255 ? 255 : $(cat /sys/class/backlight/amdgpu_bl1/brightness) + 10 )) | tee /sys/class/backlight/amdgpu_bl1/brightness >/dev/null

                bind = $mainMod, backslash, exec, hyprlock # Make a variable so we can change it defined by lockscreen module

                bindl=,switch:on:Lid Switch, exec, hyprlock

                bind = , Print, exec, grim -t png -g "$(slurp -d)" ${config.xdg.userDirs.pictures}/screenshots/$(date +'%F_%I-%M-%S_%p.png') | wl-copy

                workspace = special:scratchpad, on-created-empty:kitty-run, gapsout:20

                # Passthrough
                bind=$mainMod, Delete, submap, passthrough
                submap=passthrough
                bind=$mainMod,escape,submap,reset
                submap=reset

                xwayland {
                  force_zero_scaling = true
                }

                workspace = 1, monitor:DP-4
                workspace = 2, monitor:DP-4
                workspace = 3, monitor:DP-4
                workspace = 4, monitor:DP-4
                workspace = 5, monitor:DP-4
                workspace = 6, monitor:DP-4
                workspace = 7, monitor:HDMI-A-2
                workspace = 8, monitor:HDMI-A-2
                workspace = 9, monitor:HDMI-A-2
                workspace = 10, monitor:HDMI-A-2

                debug {
                  overlay = false
                }
      '';
    };
  };
}
