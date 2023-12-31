{
  config,
  osConfig ? {},
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.gui.cursors;
in {
  options.modules.gui.cursors = {
    enable = mkEnableOption "Cursors";
  };

  config = mkIf cfg.enable {
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.apple-cursor;
      name = "macOS-Monterey";
      size = 28;
    };
  };
}
