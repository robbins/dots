{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.gui.rofi;
in
{
  options.modules.gui.rofi = {
    enable = lib.mkEnableOption "Rofi";
  };

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      font = "PragmataPro Mono Liga 14";
      theme = "gruvbox-dark-hard";
    };
  };
}
