{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.gui.kitty;
in {
  options.modules.gui.kitty = {
    enable = mkEnableOption "Kitty";
  };

  config = mkIf cfg.enable 
  (let
    kitty-run = (pkgs.writeShellScriptBin "kitty-run" ''
      export MESA_LOADER_DRIVER_OVERRIDE=radeonsi
      export __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json
      exec kitty
    '');
  in
  {
    home.packages = [ kitty-run ];
    programs.zsh.shellAliases = {
      kitty = "MESA_LOADER_DRIVER_OVERRIDE=radeonsi __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json kitty";
    };
    programs.kitty = {
      extraConfig = ''
        font_family PragmataPro Mono Liga Regular
	font_size 14.0
      '';
      enable = true;
      keybindings = {
      };
      settings = {
        window_margin_width = "2";

        # https://s3.amazonaws.com/burkelibbey/maybe-gruvbox-but-dunno.itermcolors
        background= "#232123";
        foreground = "#e4d4ac";

        selection_background= "#ebdbb2";
        selection_foreground= "#e4d4ac";

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

        cursor = "#dad0ba";
        cursor_text_color = "#272727";
        url_color = "#d65c0d";

        enable_audio_bell = false;
	hide_window_decorations = true;

	shell = "zsh";

	tab_bar_edge = "top";
      };
    };
  });
}
