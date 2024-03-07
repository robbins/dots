{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.gui.kitty;
in {
  options.modules.gui.kitty = {
    enable = mkEnableOption "Kitty";
  };

  config =
    mkIf cfg.enable
    (let
      kitty-run = pkgs.writeShellScriptBin "kitty-run" ''
        export MESA_LOADER_DRIVER_OVERRIDE=radeonsi
        export __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json
        exec kitty
      '';
    in {
      home.packages = [kitty-run];
      programs.zsh.shellAliases = {
        kitty = "MESA_LOADER_DRIVER_OVERRIDE=radeonsi __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json kitty";
      };
      programs.kitty = {
        extraConfig = ''
          font_family PragmataPro Mono Liga Regular
          bold_font PragmataPro Mono Liga Bold
          italic_font PragmataPro Mono Liga Italic
          bold_italic_font PragmataPro Mono Liga Bold Ital
          # font_size 13.0
          # Nerd Fonts v2.3.3
          symbol_map U+23FB-U+23FE,U+2665,U+26A1,U+2B58,U+E000-U+E00A,U+E0A0-U+E0A3,U+E0B0-U+E0C8,U+E0CA,U+E0CC-U+E0D4,U+E200-U+E2A9,U+E300-U+E3E3,U+E5FA-U+E6B1,U+E700-U+E7C5,U+EA60-U+EBEB,U+F000-U+F2E0,U+F300-U+F372,U+F400-U+F532,U+F500-U+FD46,U+F0001-U+F1AF0 Symbols Nerd Font Mono
        '';
        enable = true;
        keybindings = {
        };
        settings = {
          draw_minimal_borders = true;

          font_size = "13.0";

          # https://s3.amazonaws.com/burkelibbey/maybe-gruvbox-but-dunno.itermcolors
          background = "#272727";
          foreground = "#ebdbb2";

          selection_background = "#ebdbb2";
          selection_foreground = "#655b53";

          active_tab_background = "#1d2021";
          active_tab_foreground = "#dfbf8e";
          active_tab_font_style = "#bold-italic";
          inactive_tab_background = "#1d2021";
          inactive_tab_foreground = "#a89984";
          inactive_tab_font_style = "#normal";

          # Black
          color0 = "#272727";
          color8 = "#928373";
          # Red
          color1 = "#cc231c";
          color9 = "#fb4833";
          # Green
          color2 = "#989719";
          color10 = "#b8ba25";
          # Yellow
          color3 = "#d79920";
          color11 = "#fabc2e";
          # Blue
          color4 = "#448488";
          color12 = "#83a597";
          # Magenta
          color5 = "#b16185";
          color13 = "#d3859a";
          # Cyan
          color6 = "#689d69";
          color14 = "#8ec07b";
          # White
          color7 = "#a89983";
          color15 = "#ebdbb2";

          cursor = "#ebdbb2";
          cursor_text_color = "#272727";
          url_color = "#d65c0d";

          enable_audio_bell = false;
          hide_window_decorations = if (config.wsl.enable or false) then true else false; # Keep window decorations on WSL

          shell = "zsh";

          tab_bar_edge = "bottom";
        };
      };
    });
}
