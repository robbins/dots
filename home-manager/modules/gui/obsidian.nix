{
  config,
  osConfig ? { },
  pkgs,
  lib,
  inputs,
  specialArgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.gui.obsidian;
in
{
  options.modules.gui.obsidian = {
    enable = mkEnableOption "Obsidian";
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.obsidian
    ];
    xdg.desktopEntries."obsidian" = {
      name = "obsidian";
      genericName = "Notes";
      # TODO: only override this if we're on Wayland
      exec = "obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland --disable-gpu %u";
      icon = "obsidian";
      type = "Application";
      categories = [
        "Office"
      ];
      mimeTypes = [ "x-scheme-handler/obsidian" ];
    };
  };
}
