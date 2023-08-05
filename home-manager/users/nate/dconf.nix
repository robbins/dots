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

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" ];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      excluded-apps = [ "org.gnome.tweaks.desktop" ];
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
      picture-uri = "file:///home/nate/.local/share/backgrounds/2023-07-04-19-38-25-hello-Grey-2-dragged.jpg";
      picture-uri-dark = "file:///home/nate/.local/share/backgrounds/2023-07-04-19-38-25-hello-Grey-2-dragged.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-seconds = true;
      color-scheme = "prefer-dark";
      cursor-theme = "WhiteSur-cursors";
      document-font-name = "SF Pro Text 11";
      enable-animations = true;
      enable-hot-corners = true;
      font-antialiasing = "rgba";
      font-hinting = "none";
      font-name = "SF Pro Text 11";
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "Cupertino-Ventura";
      locate-pointer = true;
      monospace-font-name = "PragmataPro Mono Regular, 11";
      show-battery-percentage = true;
      text-scaling-factor = 1.0;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" ];
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
      speed = 0.0;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = true;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      lock-delay = mkUint32 30;
      picture-options = "zoom";
      picture-uri = "file:///home/nate/.local/share/backgrounds/2023-07-04-19-38-25-hello-Grey-2-dragged.jpg";
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
      workspace-names = [ "1" "2" ];
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
      binding = "<Mod4>Return";
      command = "env MESA_LOADER_DRIVER_OVERRIDE=radeonsi __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json kitty";
      name = "Kitty";
    };

    "org/gnome/shell" = {
      app-picker-layout = "[{'brave-browser.desktop': <{'position': <0>}>, 'org.gnome.Extensions.desktop': <{'position': <1>}>, 'kitty.desktop': <{'position': <2>}>, 'looking-glass-client.desktop': <{'position': <3>}>, 'nvim.desktop': <{'position': <4>}>, 'nixos-manual.desktop': <{'position': <5>}>, 'nvidia-settings.desktop': <{'position': <6>}>, 'rog-control-center.desktop': <{'position': <7>}>, 'org.gnome.Tour.desktop': <{'position': <8>}>, 'virt-manager.desktop': <{'position': <9>}>, 'org.gnome.Settings.desktop': <{'position': <10>}>, 'Utilities': <{'position': <11>}>, 'org.gnome.tweaks.desktop': <{'position': <12>}>}]";
      disabled-extensions = [ "blur-my-shell@aunetx" "apps-menu@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "rounded-window-corners@yilozt" "tiling-assistant@leleat-on-github" "just-perfection-desktop@just-perfection" "space-bar@luchrioh" "places-menu@gnome-shell-extensions.gcampax.github.com" ];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "44.1";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      color-and-noise = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      blur = false;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      activities-button = false;
      app-menu = false;
      app-menu-icon = true;
      app-menu-label = false;
      background-menu = false;
      clock-menu = true;
      controls-manager-spacing-size = 0;
      dash = true;
      dash-icon-size = 48;
      dash-separator = false;
      double-super-to-appgrid = true;
      events-button = true;
      gesture = true;
      hot-corner = false;
      osd = true;
      panel = true;
      panel-arrow = true;
      panel-corner-size = 0;
      panel-in-overview = true;
      panel-size = 28;
      ripple-box = false;
      search = false;
      show-apps-button = false;
      startup-status = 0;
      theme = false;
      top-panel-position = 0;
      window-demands-attention-focus = false;
      window-picker-icon = true;
      window-preview-caption = true;
      window-preview-close-button = true;
      workspace = true;
      workspace-background-corner-size = 0;
      workspace-popup = true;
      workspace-switcher-size = 11;
      workspaces-in-app-grid = true;
      world-clock = false;
    };

    "org/gnome/shell/extensions/rounded-window-corners" = {
      border-color = mkTuple [ 0.28333333134651184 0.2748333215713501 ];
      border-width = 1;
      custom-rounded-corner-settings = "@a{sv} {}";
      enable-preferences-entry = false;
      global-rounded-corner-settings = "{'padding': <{'left': <uint32 1>, 'right': <uint32 1>, 'top': <uint32 1>, 'bottom': <uint32 1>}>, 'keep_rounded_corners': <{'maximized': <false>, 'fullscreen': <false>}>, 'border_radius': <uint32 12>, 'smoothing': <0.69999999999999996>, 'enabled': <true>}";
      settings-version = mkUint32 5;
      skip-libadwaita-app = true;
      tweak-kitty-terminal = false;
    };

    "org/gnome/shell/extensions/space-bar/appearance" = {
      workspace-margin = 0;
      workspaces-bar-padding = 0;
    };

    "org/gnome/shell/extensions/space-bar/behavior" = {
      position = "left";
      position-index = 0;
      show-empty-workspaces = false;
      smart-workspace-names = false;
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
      import-layout-examples = false;
      last-version-installed = 41;
      maximize-with-gap = true;
      overridden-settings = "{'org.gnome.mutter.edge-tiling': <@mb nothing>, 'org.gnome.desktop.wm.keybindings.maximize': <@mb nothing>, 'org.gnome.desktop.wm.keybindings.unmaximize': <@mb nothing>, 'org.gnome.mutter.keybindings.toggle-tiled-left': <@mb nothing>, 'org.gnome.mutter.keybindings.toggle-tiled-right': <@mb nothing>}";
      restore-window = [ "<Super>Down" ];
      search-popup-layout = [];
      single-screen-gap = 4;
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
      window-gap = 2;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.28333333134651184 0.2748333215713501 ]) (mkTuple [ 8.68000015616417e-2 8.786666393280029e-2 ]) (mkTuple [ 0.75 0.2499999850988388 ]) (mkTuple [ 0.5 0.5 ]) ];
      selected-color = mkTuple [ true 0.28333333134651184 ];
    };

  };
}
