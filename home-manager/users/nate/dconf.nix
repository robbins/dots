# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [];
      index-single-directories = [];
    };

    "org/gnome/control-center" = {
      last-panel = "display";
      window-state = mkTuple [ 980 640 ];
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-magnifier-enabled = false;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" ];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/nate/.local/share/backgrounds/2022-10-22-17-05-49-apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg";
      picture-uri-dark = "file:///home/nate/.local/share/backgrounds/2022-10-22-17-05-49-apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "lv3:ralt_switch" "compose:ralt" ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-seconds = true;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      cursor-blink-time = 1064;
      cursor-theme = "WhiteSur-cursors";
      document-font-name = "SF Pro Text 11";
      enable-animations = true;
      enable-hot-corners = true;
      font-antialiasing = "rgba";
      font-hinting = "none";
      font-name = "SF Pro Text 11";
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "Cupertino-Ventura";
      locate-pointer = false;
      monospace-font-name = "PragmataPro Mono Regular, 11";
      show-battery-percentage = true;
      text-scaling-factor = 1.0;
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" "microsoft-edge-dev" "org-gnome-settings" ];
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/microsoft-edge-dev" = {
      application-id = "microsoft-edge-dev.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "default";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      disable-while-typing = false;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      disable-camera = true;
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      lock-delay = mkUint32 30;
      picture-options = "zoom";
      picture-uri = "file:///home/nate/.local/share/backgrounds/2022-10-22-17-05-49-apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      disable-external = true;
      sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/wm/keybindings" = {
      maximize = [];
      minimize = [];
      move-to-workspace-down = [ "<Control><Shift><Alt>Down" ];
      move-to-workspace-left = [ "<Super><Shift><Alt>Left" "<Control><Shift><Alt>Left" "<Super><Shift>Page_Up" ];
      move-to-workspace-right = [ "<Super><Shift><Alt>Right" "<Control><Shift><Alt>Right" "<Super><Shift>Page_Down" ];
      move-to-workspace-up = [ "<Control><Shift><Alt>Up" ];
      switch-to-workspace-down = [ "<Control><Alt>Down" ];
      switch-to-workspace-left = [ "<Super><Alt>Left" "<Control><Alt>Left" "<Super>Page_Up" ];
      switch-to-workspace-right = [ "<Super><Alt>Right" "<Control><Alt>Right" "<Super>Page_Down" ];
      switch-to-workspace-up = [ "<Control><Alt>Up" ];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close:appmenu";
      focus-mode = "click";
      num-workspaces = 9;
      titlebar-font = "SF Pro Display 11";
      workspace-names = [ "1" "2" "3" ];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      dynamic-workspaces = false;
      edge-tiling = false;
      workspaces-only-on-primary = false;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
      night-light-temperature = mkUint32 1700;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      screensaver = [ "<Super>backslash" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "env MESA_LOADER_DRIVER_OVERRIDE=radeonsi __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json kitty";
      name = "Kitty";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "nothing";
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      disabled-extensions = [ "blur-my-shell@aunetx" "window-list@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "just-perfection-desktop@just-perfection" "space-bar@luchrioh" "places-menu@gnome-shell-extensions.gcampax.github.com" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "rounded-window-corners@yilozt" "tiling-assistant@leleat-on-github" "drive-menu@gnome-shell-extensions.gcampax.github.com" "native-window-placement@gnome-shell-extensions.gcampax.github.com" ];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "44.1";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      activities-button = false;
      activities-button-icon-monochrome = false;
      activities-button-label = false;
      animation = 4;
      app-menu = false;
      app-menu-icon = false;
      app-menu-label = false;
      controls-manager-spacing-size = 0;
      dash = false;
      dash-icon-size = 56;
      dash-separator = false;
      panel = true;
      panel-icon-size = 0;
      panel-in-overview = false;
      panel-indicator-padding-size = 0;
      panel-size = 28;
      power-icon = false;
      ripple-box = false;
      search = false;
      show-apps-button = false;
      startup-status = 0;
      switcher-popup-delay = true;
      theme = false;
      window-picker-icon = true;
      workspace-background-corner-size = 9;
      workspace-switcher-size = 11;
      workspace-wrap-around = true;
    };

    "org/gnome/shell/extensions/rounded-window-corners" = {
      border-color = mkTuple [ 0.3566666543483734 0.3566666543483734 ];
      border-width = 1;
      custom-rounded-corner-settings = "@a{sv} {}";
      focused-shadow = "{'vertical_offset': 4, 'horizontal_offset': 0, 'blur_offset': 28, 'spread_radius': 4, 'opacity': 60}";
      global-rounded-corner-settings = "{'padding': <{'left': <uint32 1>, 'right': <uint32 1>, 'top': <uint32 1>, 'bottom': <uint32 1>}>, 'keep_rounded_corners': <{'maximized': <true>, 'fullscreen': <true>}>, 'border_radius': <uint32 12>, 'smoothing': <uint32 0>, 'enabled': <true>}";
      settings-version = mkUint32 5;
      tweak-kitty-terminal = false;
      unfocused-shadow = "{'horizontal_offset': 0, 'vertical_offset': 2, 'blur_offset': 12, 'spread_radius': -1, 'opacity': 65}";
    };

    "org/gnome/shell/extensions/space-bar/appearance" = {
      active-workspace-font-weight = "700";
      empty-workspace-font-weight = "700";
      inactive-workspace-font-weight = "700";
      workspace-margin = 0;
      workspaces-bar-padding = 0;
    };

    "org/gnome/shell/extensions/space-bar/behavior" = {
      position-index = 0;
      show-empty-workspaces = true;
    };

    "org/gnome/shell/extensions/tiling-assistant" = {
      activate-layout0 = [];
      activate-layout1 = [];
      activate-layout2 = [];
      activate-layout3 = [];
      active-window-hint = 1;
      active-window-hint-color = "rgb(53,132,228)";
      auto-tile = [];
      center-window = [];
      debugging-free-rects = [];
      debugging-show-tiled-rects = [];
      default-move-mode = 0;
      dynamic-keybinding-behavior = 0;
      enable-tiling-popup = true;
      import-layout-examples = false;
      last-version-installed = 42;
      maximize-with-gap = true;
      overridden-settings = "{'org.gnome.mutter.edge-tiling': <false>}";
      restore-window = [ "<Super>Down" ];
      search-popup-layout = [];
      single-screen-gap = 8;
      tile-bottom-half = [ "<Super>KP_2" ];
      tile-bottom-half-ignore-ta = [];
      tile-bottomleft-quarter = [ "<Super>KP_1" ];
      tile-bottomleft-quarter-ignore-ta = [];
      tile-bottomright-quarter = [ "<Super>KP_3" ];
      tile-bottomright-quarter-ignore-ta = [];
      tile-edit-mode = [];
      tile-left-half = [ "<Super>Left" "<Super>KP_4" ];
      tile-left-half-ignore-ta = [];
      tile-maximize = [ "<Super>Up" "<Super>KP_5" ];
      tile-maximize-horizontally = [];
      tile-maximize-vertically = [];
      tile-right-half = [ "<Super>Right" "<Super>KP_6" ];
      tile-right-half-ignore-ta = [];
      tile-top-half = [ "<Super>KP_8" ];
      tile-top-half-ignore-ta = [];
      tile-topleft-quarter = [ "<Super>KP_7" ];
      tile-topleft-quarter-ignore-ta = [];
      tile-topright-quarter = [ "<Super>KP_9" ];
      tile-topright-quarter-ignore-ta = [];
      toggle-always-on-top = [];
      toggle-tiling-popup = [];
      window-gap = 4;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.3566666543483734 0.3566666543483734 ]) (mkTuple [ 0.5433333516120911 0.5433333516120911 ]) (mkTuple [ 0.5 0.5 ]) ];
      selected-color = mkTuple [ true 0.3566666543483734 ];
    };

    "org/virt-manager/virt-manager" = {
      manager-window-height = 550;
      manager-window-width = 550;
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };

    "org/virt-manager/virt-manager/details" = {
      show-toolbar = true;
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = false;
      network-traffic = false;
    };

    "org/virt-manager/virt-manager/vms/d3ecee0cf400448685b6517d6e287016" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 831 ];
    };

  };
}
