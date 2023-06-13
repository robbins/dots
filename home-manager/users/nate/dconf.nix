# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
      saved-pathbar-path = "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding";
      saved-view = "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding";
      window-height = 500;
      window-is-maximized = false;
      window-width = 566;
    };

    "com/raggesilver/BlackBox" = {
      cursor-blink-mode = mkUint32 2;
      cursor-shape = mkUint32 0;
      custom-shell-command = "zsh";
      easy-copy-paste = true;
      floating-controls = false;
      font = "PragmataPro Mono Liga 12";
      headerbar-draw-line-single-tab = false;
      hide-single-tab = true;
      scrollback-mode = mkUint32 1;
      show-headerbar = true;
      show-menu-button = true;
      stealth-single-tab = true;
      theme-dark = "Tommorow Night";
      use-custom-command = true;
      was-maximized = true;
      window-show-borders = true;
    };

    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [];
      index-single-directories = [];
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [ 652 481 ];
    };

    "org/gnome/GWeather4" = {
      temperature-unit = "centigrade";
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

    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = true;
      window-size = mkTuple [ 768 600 ];
    };

    "org/gnome/cheese" = {
      burst-delay = 1000;
    };

    "org/gnome/control-center" = {
      last-panel = "power";
      window-state = mkTuple [ 980 640 ];
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
      picture-uri = "file:///home/nate/.local/share/backgrounds/2022-11-02-12-58-12-13-Ventura-Dark.jpg";
      picture-uri-dark = "file:///home/nate/.local/share/backgrounds/2022-11-02-12-58-12-13-Ventura-Dark.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "compose:ralt" ];
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
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
      application-children = [ "org-gnome-console" "org-gnome-settings" "gnome-power-panel" "brave-browser" ];
    };

    "org/gnome/desktop/notifications/application/brave-browser" = {
      application-id = "brave-browser.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
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

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/nate/.local/share/backgrounds/2022-11-02-12-58-12-13-Ventura-Dark.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [ "org.gnome.Nautilus.desktop" ];
      enabled = [ "org.gnome.Weather.desktop" ];
      sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/wm/preferences" = {
      auto-raise = false;
      button-layout = "appmenu:close";
      focus-mode = "sloppy";
      num-workspaces = 9;
      resize-with-right-button = false;
      titlebar-font = "System-ui Bold 11";
    };

    "org/gnome/evince" = {
      document-directory = "@ms 'file:///home/nate/downloads'";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = false;
      edge-tiling = false;
      workspaces-only-on-primary = false;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
    };

    "org/gnome/photos" = {
      window-maximized = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-last-coordinates = mkTuple [ 43.658566042647934 (-79.4343) ];
      night-light-temperature = mkUint32 1700;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Mod4>Return";
      command = "env MESA_LOADER_DRIVER_OVERRIDE=radeonsi __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json kitty";
      name = "Kitty";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "nothing";
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      always-show-log-out = true;
      app-picker-layout = "[{'com.raggesilver.BlackBox.desktop': <{'position': <0>}>, 'brave-browser.desktop': <{'position': <1>}>, 'org.gnome.Weather.desktop': <{'position': <2>}>, 'org.gnome.clocks.desktop': <{'position': <3>}>, 'org.gnome.Calendar.desktop': <{'position': <4>}>, 'org.gnome.Extensions.desktop': <{'position': <5>}>, 'org.gnome.Nautilus.desktop': <{'position': <6>}>, 'kitty.desktop': <{'position': <7>}>, 'org.gnome.Calculator.desktop': <{'position': <8>}>, 'looking-glass-client.desktop': <{'position': <9>}>, 'nvim.desktop': <{'position': <10>}>, 'org.gnome.Settings.desktop': <{'position': <11>}>, 'nvidia-settings.desktop': <{'position': <12>}>, 'rog-control-center.desktop': <{'position': <13>}>, 'virt-manager.desktop': <{'position': <14>}>, 'org.pwmt.zathura.desktop': <{'position': <15>}>, 'nixos-manual.desktop': <{'position': <16>}>, 'org.gnome.Console.desktop': <{'position': <17>}>, 'org.gnome.font-viewer.desktop': <{'position': <18>}>, 'org.gnome.tweaks.desktop': <{'position': <19>}>, 'org.gnome.eog.desktop': <{'position': <20>}>, 'org.gnome.seahorse.Application.desktop': <{'position': <21>}>, 'org.gnome.DiskUtility.desktop': <{'position': <22>}>, 'org.gnome.Connections.desktop': <{'position': <23>}>}]";
      disable-user-extensions = false;
      disabled-extensions = [ "gestureImprovements@gestures" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "horizontal-workspace-indicator@tty2.io" "native-window-placement@gnome-shell-extensions.gcampax.github.com" "window-list@gnome-shell-extensions.gcampax.github.com" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "blur-my-shell@aunetx" "just-perfection-desktop@just-perfection" "places-menu@gnome-shell-extensions.gcampax.github.com" "drive-menu@gnome-shell-extensions.gcampax.github.com" "switcher@landau.fi" ];
      enabled-extensions = [ "vertical-workspaces@G-dH.github.com" "paperwm@hedning:matrix.org" ];
      favorite-apps = [];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "44.1";
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      brightness = 0.55;
      customize = true;
      noise-amount = 0.0;
      sigma = 65;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      brightness = 0.55;
      customize = true;
      sigma = 200;
      style-components = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      brightness = 0.2;
      customize = true;
      sigma = 140;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      activities-button = false;
      activities-button-icon-monochrome = true;
      animation = 1;
      app-menu = true;
      app-menu-icon = true;
      app-menu-label = true;
      calendar = true;
      clock-menu = true;
      controls-manager-spacing-size = 0;
      dash = true;
      events-button = true;
      keyboard-layout = true;
      notification-banner-position = 2;
      panel = true;
      panel-size = 28;
      search = false;
      show-apps-button = false;
      startup-status = 1;
      theme = true;
      window-demands-attention-focus = true;
      workspace-wrap-around = true;
    };

    "org/gnome/shell/extensions/paperwm" = {
      has-installed-config-template = true;
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = [ "0760a18b-e8d0-46cf-86e4-f6eb3189dc56" "5a5855b2-1a8f-4f0b-8959-4f6d8931fdf7" "5a9598bb-c89b-4ce1-93d8-b22c1d396361" "a1550d07-27c1-477c-9588-2e71a6fbcd9d" "73c45445-eb16-475a-829b-49a3bfd8d08e" "8aecbb94-16dc-4de8-98d5-2847c2aae258" "5a04980f-605f-44be-8fe4-745c8c311e9c" "8982f387-81fa-407a-86b6-ea79c84f728d" "b3f6b448-9fb7-4cf0-9448-a833aee2a61b" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/0760a18b-e8d0-46cf-86e4-f6eb3189dc56" = {
      index = 0;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/5a04980f-605f-44be-8fe4-745c8c311e9c" = {
      index = 6;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/5a5855b2-1a8f-4f0b-8959-4f6d8931fdf7" = {
      index = 1;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/5a9598bb-c89b-4ce1-93d8-b22c1d396361" = {
      index = 2;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/73c45445-eb16-475a-829b-49a3bfd8d08e" = {
      index = 4;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/8982f387-81fa-407a-86b6-ea79c84f728d" = {
      index = 7;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/8aecbb94-16dc-4de8-98d5-2847c2aae258" = {
      index = 5;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/a1550d07-27c1-477c-9588-2e71a6fbcd9d" = {
      index = 3;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/b3f6b448-9fb7-4cf0-9448-a833aee2a61b" = {
      index = 8;
    };

    "org/gnome/shell/extensions/vertical-workspaces" = {
      center-dash-to-ws = false;
      dash-position = 4;
      hot-corner-action = 0;
      hot-corner-ripples = true;
      osd-position = 6;
      overview-mode = 0;
      panel-position = 0;
      panel-visibility = 0;
      profile-name-1 = "GNOME 3";
      profile-name-2 = "GNOME 40+ - Bottom Hot Edge";
      profile-name-3 = "Hot Corner Centric - Top Left Hot Corner";
      profile-name-4 = "Dock Overview - Bottom Hot Edge";
      search-fuzzy = true;
      secondary-ws-preview-shift = false;
      secondary-ws-thumbnails-position = 2;
      show-search-entry = false;
      startup-state = 1;
      ws-thumbnails-position = 0;
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = "[<(uint32 2, <('Toronto', 'CYTZ', true, [(0.76154532446909495, -1.3857914260834978)], [(0.76212711252195475, -1.3860823201099277)])>)>]";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/system/location" = {
      enabled = true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
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
