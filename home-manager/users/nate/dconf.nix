# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [];
      index-single-directories = [];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-seconds = true;
      color-scheme = "prefer-dark";
      cursor-theme = "WhiteSur-cursors";
      document-font-name = "SF Pro Text 11";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "rgba";
      font-hinting = "slight";
      font-name = "SF Pro Text 11";
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "Cupertino-Ventura";
      locate-pointer = true;
      monospace-font-name = "PragmataPro Mono Regular, 11";
      show-battery-percentage = true;
      text-scaling-factor = 1.0;
    };

    "org/gnome/desktop/wm/keybindings" = {
      minimize = [];
      move-to-workspace-down = [ "<Control><Shift><Alt>Down" ];
      move-to-workspace-left = [ "<Super><Shift><Alt>Left" "<Control><Shift><Alt>Left" "<Super><Shift>Page_Up" ];
      move-to-workspace-right = [ "<Super><Shift><Alt>Right" "<Control><Shift><Alt>Right" "<Super><Shift>Page_Down" ];
      move-to-workspace-up = [ "<Control><Shift><Alt>Up" ];
      switch-to-workspace-down = [ "<Control><Alt>Down" ];
      switch-to-workspace-left = [ "<Super><Alt>Left" "<Control><Alt>Left" "<Super>Page_Up" ];
      switch-to-workspace-right = [ "<Super><Alt>Right" "<Control><Alt>Right" "<Super>Page_Down" ];
      switch-to-workspace-up = [ "<Control><Alt>Up" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close:appmenu";
      focus-mode = "click";
      num-workspaces = 9;
      titlebar-font = "SF Pro Display 11";
      workspace-names = [ "Workspace 1" "Workspace 2" "Workspace 3" ];
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      dynamic-workspaces = false;
      workspaces-only-on-primary = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      screensaver = [ "<Super>backslash" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Mod4>Return";
      command = "env MESA_LOADER_DRIVER_OVERRIDE=radeonsi __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json kitty";
      name = "Kitty";
    };

    "org/gnome/shell" = {
      welcome-dialog-last-shown-version = "44.1";
    };
  };
}
