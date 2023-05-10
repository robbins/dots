# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "com/raggesilver/BlackBox" = {
      cursor-blink-mode = mkUint32 2;
      cursor-shape = mkUint32 0;
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
      window-show-borders = true;
    };

    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [ "&MUSIC" "&PICTURES" "&VIDEOS" "&DOWNLOAD" ];
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [ 652 481 ];
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
      picture-uri = "file:///home/nate/.local/share/backgrounds/2022-11-02-12-58-07-13-Ventura-Light.jpg";
      picture-uri-dark = "file:///home/nate/.local/share/backgrounds/2022-11-02-12-58-07-13-Ventura-Light.jpg";
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
      font-antialiasing = "rgba";
      font-hinting = "medium";
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
      picture-uri = "file:///home/nate/.local/share/backgrounds/2022-11-02-12-58-07-13-Ventura-Light.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      enabled = [ "org.gnome.Weather.desktop" ];
      sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/wm/preferences" = {
      focus-mode = "sloppy";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/nautilus/preferences" = {
      migrated-gtk-settings = true;
    };

    "org/gnome/photos" = {
      window-maximized = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-last-coordinates = mkTuple [ 43.661535123817686 (-79.4343) ];
      night-light-temperature = mkUint32 1700;
    };

    "org/gnome/shell" = {
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "44.1";
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
