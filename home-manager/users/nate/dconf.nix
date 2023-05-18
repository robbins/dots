# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
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
      last-panel = "background";
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
      font-antialiasing = "rgba";
      font-hinting = "medium";
      font-name = "System-ui 11";
      icon-theme = "BigSur";
      locate-pointer = true;
      monospace-font-name = "PragmataPro Liga 10";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-console" "org-gnome-settings" ];
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "adaptive";
      natural-scroll = true;
      speed = 0.333333;
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
      resize-with-right-button = false;
      titlebar-font = "System-ui Bold 11";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = true;
      edge-tiling = true;
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
      night-light-last-coordinates = mkTuple [ 43.66293132111719 (-79.4343) ];
      night-light-temperature = mkUint32 1700;
    };

    "org/gnome/shell" = {
      app-picker-layout = "[{'com.raggesilver.BlackBox.desktop': <{'position': <0>}>, 'brave-browser.desktop': <{'position': <1>}>, 'org.gnome.Weather.desktop': <{'position': <2>}>, 'org.gnome.clocks.desktop': <{'position': <3>}>, 'org.gnome.Calendar.desktop': <{'position': <4>}>, 'org.gnome.Extensions.desktop': <{'position': <5>}>, 'org.gnome.Nautilus.desktop': <{'position': <6>}>, 'kitty.desktop': <{'position': <7>}>, 'org.gnome.Calculator.desktop': <{'position': <8>}>, 'looking-glass-client.desktop': <{'position': <9>}>, 'nvim.desktop': <{'position': <10>}>, 'org.gnome.Settings.desktop': <{'position': <11>}>, 'nvidia-settings.desktop': <{'position': <12>}>, 'rog-control-center.desktop': <{'position': <13>}>, 'virt-manager.desktop': <{'position': <14>}>, 'org.pwmt.zathura.desktop': <{'position': <15>}>, 'nixos-manual.desktop': <{'position': <16>}>, 'org.gnome.Console.desktop': <{'position': <17>}>, 'org.gnome.font-viewer.desktop': <{'position': <18>}>, 'org.gnome.tweaks.desktop': <{'position': <19>}>, 'org.gnome.eog.desktop': <{'position': <20>}>, 'org.gnome.seahorse.Application.desktop': <{'position': <21>}>, 'org.gnome.DiskUtility.desktop': <{'position': <22>}>, 'org.gnome.Connections.desktop': <{'position': <23>}>}]";
      disabled-extensions = [ "gestureImprovements@gestures" ];
      enabled-extensions = [ "places-menu@gnome-shell-extensions.gcampax.github.com" "drive-menu@gnome-shell-extensions.gcampax.github.com" "blur-my-shell@aunetx" "just-perfection-desktop@just-perfection" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "native-window-placement@gnome-shell-extensions.gcampax.github.com" ];
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

  };
}
