{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.gui.wezterm;
in
{
  options.modules.gui.wezterm = {
    enable = mkEnableOption "Wezterm";
  };

  config = mkIf cfg.enable (
    let
      wezterm-run = pkgs.writeShellScriptBin "wezterm-run" ''
        export MESA_LOADER_DRIVER_OVERRIDE=radeonsi
        export __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json
        exec wezterm
      '';
    in
    {
      home.packages = [ wezterm-run ];
      programs.zsh.shellAliases = {
        wezterm = "MESA_LOADER_DRIVER_OVERRIDE=radeonsi __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json wezterm";
      };
      programs.wezterm = {
        enable = true;
      };
    }
  );
}
