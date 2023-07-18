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
      last-panel = "bluetooth";
      window-state = mkTuple [ 980 1064 ];
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
      xkb-options = [ "terminate:ctrl_alt_bksp" "lv3:rwin_switch" "compose:ralt" ];
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
      font-hinting = "none";
      font-name = "SF Pro Text 11";
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "Cupertino-Ventura";
      locate-pointer = false;
      monospace-font-name = "PragmataPro Mono Regular, 11";
      show-battery-percentage = true;
      text-scaling-factor = 1.0;
    };

    "org/gnome/desktop/media-handling" = {
      autorun-never = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-tweaks" ];
    };

    "org/gnome/desktop/notifications/application/org-gnome-tweaks" = {
      application-id = "org.gnome.tweaks.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "adaptive";
      natural-scroll = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      edge-scrolling-enabled = false;
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
      lock-delay = mkUint32 30;
      picture-options = "zoom";
      picture-uri = "file:///home/nate/.local/share/backgrounds/2022-10-22-17-05-49-apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
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

    "org/gnome/evolution-data-server" = {
      migrated = true;
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
      binding = "<Super>Return";
      command = "kitty-run";
      name = "Kitty";
    };

    "org/gnome/shell" = {
      disabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" "vertical-workspaces@G-dH.github.com" ];
      enabled-extensions = [ "paperwm@hedning:matrix.org" "just-perfection-desktop@just-perfection" "blur-my-shell@aunetx" "hidetopbar@mathieu.bidon.ca" "places-menu@gnome-shell-extensions.gcampax.github.com" ];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "44.1";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      color-and-noise = false;
      hacks-level = 1;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/hidetopbar" = {
      compatibility = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = false;
      customize = false;
      sigma = 146;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      brightness = 0.62;
      customize = true;
      override-background = true;
      override-background-dynamically = false;
      sigma = 139;
      static-blur = true;
      style-panel = 0;
      unblur-in-overview = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      blur = false;
    };

    "org/gnome/shell/extensions/hidetopbar" = {
      animation-time-autohide = 0.10000000000000003;
      animation-time-overview = 0.4;
      enable-active-window = false;
      enable-intellihide = false;
      keep-round-corners = true;
      mouse-sensitive = true;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      activities-button = false;
      activities-button-icon-monochrome = false;
      activities-button-label = false;
      alt-tab-window-preview-size = 0;
      animation = 3;
      app-menu = false;
      app-menu-icon = false;
      app-menu-label = false;
      background-menu = true;
      controls-manager-spacing-size = 36;
      dash = false;
      dash-icon-size = 0;
      dash-separator = false;
      double-super-to-appgrid = true;
      events-button = false;
      gesture = true;
      hot-corner = false;
      keyboard-layout = false;
      osd = true;
      osd-position = 0;
      panel = true;
      panel-arrow = true;
      panel-button-padding-size = 0;
      panel-corner-size = 0;
      panel-icon-size = 14;
      panel-in-overview = true;
      panel-indicator-padding-size = 0;
      panel-notification-icon = true;
      panel-size = 30;
      power-icon = true;
      ripple-box = false;
      search = false;
      show-apps-button = false;
      startup-status = 0;
      switcher-popup-delay = true;
      theme = false;
      window-demands-attention-focus = false;
      window-picker-icon = false;
      window-preview-caption = true;
      window-preview-close-button = false;
      workspace = false;
      workspace-background-corner-size = 0;
      workspace-popup = true;
      workspaces-in-app-grid = true;
    };

    "org/gnome/shell/extensions/paperwm" = {
      cycle-width-steps = [ 0.38195 0.5 0.61804 ];
      horizontal-margin = 8;
      show-window-position-bar = false;
      use-default-background = true;
      vertical-margin = 8;
      vertical-margin-bottom = 8;
      window-gap = 8;
      winprops = [];
    };

    "org/gnome/shell/extensions/paperwm/keybindings" = {
      move-down = [ "" ];
      move-left = [ "<Shift><Control>h" ];
      move-monitor-above = [ "<Shift><Alt>k" ];
      move-monitor-below = [ "<Shift><Alt>j" ];
      move-monitor-left = [ "" ];
      move-monitor-right = [ "" ];
      move-right = [ "<Shift><Control>l" ];
      move-up = [ "" ];
      switch-down = [ "" ];
      switch-left = [ "<Super>h" ];
      switch-monitor-above = [ "<Shift><Super>k" ];
      switch-monitor-below = [ "<Shift><Super>j" ];
      switch-monitor-left = [ "" ];
      switch-monitor-right = [ "" ];
      switch-right = [ "<Super>l" ];
      switch-up = [ "" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = [ "08c2cff7-e19a-4b34-ad72-568921870b7f" "ead9b3b1-93dc-4caf-bf42-99d535f65801" "a1eca3a6-7e8f-4f10-98c9-861a9df7915e" "26530fca-192e-48c3-aacd-0f759a33ddca" "ec4288a1-92a2-4c47-b42c-59926166950f" "12eaba9e-1a11-41dd-a03a-93458138957b" "559e330d-ad88-445b-b5a6-73558ec2f156" "83d3e804-7b2c-4250-8bca-f8634c2d9cf5" "ad8eab07-a02f-4372-8b45-1fcdf2ba6d77" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/08c2cff7-e19a-4b34-ad72-568921870b7f" = {
      index = 0;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/12eaba9e-1a11-41dd-a03a-93458138957b" = {
      index = 5;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/26530fca-192e-48c3-aacd-0f759a33ddca" = {
      index = 3;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/559e330d-ad88-445b-b5a6-73558ec2f156" = {
      index = 6;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/83d3e804-7b2c-4250-8bca-f8634c2d9cf5" = {
      index = 7;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/a1eca3a6-7e8f-4f10-98c9-861a9df7915e" = {
      index = 2;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/ad8eab07-a02f-4372-8b45-1fcdf2ba6d77" = {
      index = 8;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/ead9b3b1-93dc-4caf-bf42-99d535f65801" = {
      index = 1;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/ec4288a1-92a2-4c47-b42c-59926166950f" = {
      index = 4;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "";
    };

    "org/gnome/shell/keybindings" = {
      toggle-application-view = [];
      toggle-overview = [];
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

  };
}
