# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
      saved-pathbar-path = "/org/gnome/";
      saved-view = "/org/gnome/";
      window-height = 991;
      window-is-maximized = false;
      window-width = 540;
    };

    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [];
      index-single-directories = [];
    };

    "org/gnome/Weather" = {
      locations = "[<(uint32 2, <('Toronto', 'CYTZ', true, [(0.76154532446909495, -1.3857914260834978)], [(0.76212711252195475, -1.3860823201099277)])>)>]";
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "basic";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      word-size = 64;
    };

    "org/gnome/control-center" = {
      last-panel = "multitasking";
      window-state = mkTuple [ 1900 1041 ];
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
      picture-uri = "file:///home/nate/.local/share/backgrounds/2023-07-04-19-58-22-Google%20Pixel%203%20Wallpaper%201.png";
      picture-uri-dark = "file:///home/nate/.local/share/backgrounds/2023-07-04-19-58-22-Google%20Pixel%203%20Wallpaper%201.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = false;
      color-scheme = "prefer-dark";
      cursor-theme = "WhiteSur-cursors";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "rgba";
      font-hinting = "medium";
      font-name = "System-ui 11";
      icon-theme = "BigSur";
      locate-pointer = true;
      monospace-font-name = "PragmataPro Liga 10";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" "org-gnome-nautilus" "kitty" "brave-browser" ];
    };

    "org/gnome/desktop/notifications/application/brave-browser" = {
      application-id = "brave-browser.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/kitty" = {
      application-id = "kitty.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "adaptive";
      natural-scroll = false;
      speed = -0.232558;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/nate/.local/share/backgrounds/2023-07-04-19-58-22-Google%20Pixel%203%20Wallpaper%201.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [ "org.gnome.Nautilus.desktop" ];
      enabled = [ "org.gnome.Weather.desktop" ];
      sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
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
      button-layout = "appmenu:close";
      focus-mode = "click";
      num-workspaces = 9;
      workspace-names = [ "Workspace 1" "Workspace 2" "Workspace 3" ];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      dynamic-workspaces = false;
      workspaces-only-on-primary = false;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 945 1042 ];
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
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
      disable-user-extensions = false;
      disabled-extensions = [ "drive-menu@gnome-shell-extensions.gcampax.github.com" "switcher@landau.fi" "rounded-window-corners@yilozt" "user-theme@gnome-shell-extensions.gcampax.github.com" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "horizontal-workspace-indicator@tty2.io" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "paperwm@hedning:matrix.org" "just-perfection-desktop@just-perfection" "blur-my-shell@aunetx" "vertical-workspaces@G-dH.github.com" "places-menu@gnome-shell-extensions.gcampax.github.com" ];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "44.1";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/hidetopbar" = {
      compatibility = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      customize = false;
      override-background = true;
      override-background-dynamically = false;
      static-blur = false;
      style-panel = 3;
    };

    "org/gnome/shell/extensions/horizontal-workspace-indicator" = {
      icons-style = "circles";
      widget-position = "right";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      activities-button = false;
      activities-button-icon-monochrome = true;
      animation = 4;
      app-menu = false;
      app-menu-icon = true;
      app-menu-label = false;
      calendar = true;
      clock-menu = true;
      clock-menu-position = 0;
      controls-manager-spacing-size = 0;
      dash = false;
      dash-separator = false;
      events-button = true;
      keyboard-layout = true;
      notification-banner-position = 2;
      panel = true;
      panel-size = 32;
      ripple-box = false;
      search = false;
      show-apps-button = false;
      startup-status = 0;
      theme = true;
      top-panel-position = 0;
      window-demands-attention-focus = true;
      window-preview-close-button = false;
      workspace = true;
      workspace-background-corner-size = 0;
      workspace-switcher-should-show = false;
      workspace-wrap-around = true;
      workspaces-in-app-grid = true;
      world-clock = false;
    };

    "org/gnome/shell/extensions/paperwm" = {
      cycle-width-steps = [ 0.25 0.3333 0.5 0.6666 ];
      default-show-top-bar = true;
      has-installed-config-template = true;
      horizontal-margin = 10;
      show-window-position-bar = true;
      topbar-follow-focus = false;
      use-default-background = false;
      vertical-margin = 5;
      vertical-margin-bottom = 5;
      window-gap = 10;
    };

    "org/gnome/shell/extensions/paperwm/keybindings" = {
      close-window = [ "<Super>q" ];
      move-down = [ "" ];
      move-down-workspace = [ "<Shift><Super>j" ];
      move-left = [ "<Shift><Super>h" ];
      move-right = [ "<Shift><Super>l" ];
      move-up = [ "" ];
      move-up-workspace = [ "<Shift><Super>k" ];
      new-window = [ "<Super>n" ];
      resize-h-dec = [ "<Control><Super>minus" ];
      resize-h-inc = [ "<Control><Super>equal" ];
      switch-down = [ "<Super>j" ];
      switch-left = [ "<Super>h" ];
      switch-monitor-above = [ "<Shift><Control>k" ];
      switch-monitor-below = [ "<Shift><Control>j" ];
      switch-right = [ "<Super>l" ];
      switch-up = [ "<Super>k" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = [ "6158c727-87ae-4bb6-b095-d2b4393ee8fd" "de4b39e6-000a-4084-b934-1d17c6f495bd" "21ca5a1f-1bcd-44e4-8a6a-686049cf634f" "3af9c5bd-456d-4fbf-a30a-e3479234b849" "f6bf0692-27e5-48de-ab73-f4fceffd014c" "af3112a2-de8a-4c89-a0ce-b26cf9f1a4a9" "8900a241-6460-40bb-93b2-ca1c9b01f0df" "4d7951f3-35df-480d-ac09-99bdf9858a29" "b4456136-cc4f-4ea9-ab48-c2677a6765b6" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/21ca5a1f-1bcd-44e4-8a6a-686049cf634f" = {
      background = "/home/nate/pictures/wallpapers/hello-Green-2-dragged.jpg";
      index = 2;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/3af9c5bd-456d-4fbf-a30a-e3479234b849" = {
      background = "/home/nate/pictures/wallpapers/hello-Orange-2-dragged.jpg";
      index = 3;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/4d7951f3-35df-480d-ac09-99bdf9858a29" = {
      background = "/home/nate/pictures/wallpapers/hello-Grey-2-dragged.jpg";
      index = 7;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/6158c727-87ae-4bb6-b095-d2b4393ee8fd" = {
      background = "/home/nate/pictures/wallpapers/hello-Blue-2-dragged.jpg";
      index = 0;
      show-top-bar = true;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/8900a241-6460-40bb-93b2-ca1c9b01f0df" = {
      background = "/home/nate/pictures/wallpapers/2021-iMac-color-matching-wallpaper-idownloadblog-Blue-Light-@AR72014.jpg";
      index = 6;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/af3112a2-de8a-4c89-a0ce-b26cf9f1a4a9" = {
      background = "/home/nate/pictures/wallpapers/hello-Yellow-2-dragged.jpg";
      index = 5;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/b4456136-cc4f-4ea9-ab48-c2677a6765b6" = {
      background = "/home/nate/pictures/wallpapers/hello-Green-1-dragged.jpg";
      index = 8;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/de4b39e6-000a-4084-b934-1d17c6f495bd" = {
      background = "/home/nate/pictures/wallpapers/hello-Yellow-1-dragged.jpg";
      index = 1;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/f6bf0692-27e5-48de-ab73-f4fceffd014c" = {
      background = "/home/nate/pictures/wallpapers/hello-Purple-2-dragged.jpg";
      index = 4;
    };

    "org/gnome/shell/extensions/rounded-window-corners" = {
      border-width = 0;
      custom-rounded-corner-settings = "@a{sv} {}";
      global-rounded-corner-settings = "{'padding': <{'left': <uint32 1>, 'right': <uint32 1>, 'top': <uint32 1>, 'bottom': <uint32 1>}>, 'keep_rounded_corners': <{'maximized': <false>, 'fullscreen': <false>}>, 'border_radius': <uint32 12>, 'smoothing': <uint32 0>}";
      settings-version = mkUint32 5;
      tweak-kitty-terminal = true;
    };

    "org/gnome/shell/extensions/switcher" = {
      activate-by-key = mkUint32 1;
      activate-immediately = true;
      fade-enable = false;
      font-size = mkUint32 28;
      launcher-stats = ''
        {"minecraft-launcher.desktop":1}\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
      matching = mkUint32 1;
      max-width-percentage = mkUint32 70;
      on-active-display = true;
      ordering = mkUint32 1;
      show-executables = true;
      show-switcher = [ "<Super>w" ];
      workspace-indicator = true;
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = "[<(uint32 2, <('Toronto', 'CYTZ', true, [(0.76154532446909495, -1.3857914260834978)], [(0.76212711252195475, -1.3860823201099277)])>)>]";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.337255 0.321569 ]) (mkTuple [ 0.192157 0.305882 ]) ];
      selected-color = mkTuple [ true 0.337255 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 859 374 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 157;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 1203 902 ];
    };

  };
}
