{
  config,
  osConfig ? { },
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.gui.lockscreen;
in
{
  options.modules.gui.lockscreen = {
    enable = mkEnableOption "Swaylock";
  };

  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          grace = 300;
        };
        background = [
          {
            path = "/home/${specialArgs.username}/pictures/wallpapers/apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg";
            blur_passes = 3;
            blur_size = 8;
          }
        ];
      };
    };
  };
}
