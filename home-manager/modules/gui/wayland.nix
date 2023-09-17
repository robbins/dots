{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.gui.wayland;
in {
  options.modules.gui.wayland = {
    enable = lib.mkEnableOption "Wayland";
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      __GL_SHADER_DISK_CACHE_PATH = "${config.xdg.cacheHome}/nv";
      CUDA_CACHE_PATH = "${config.xdg.cacheHome}/nv";
    };

    home.packages = with pkgs; [
      wl-clipboard
      slurp
      grim
    ];
  };
}
