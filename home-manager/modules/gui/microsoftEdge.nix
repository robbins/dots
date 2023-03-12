{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.gui.microsoftEdge;
in {
  options.modules.gui.microsoftEdge = { 
    enable = lib.mkEnableOption "Microsoft Edge"; 
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.microsoft-edge-dev ];
    xdg.desktopEntries."microsoft-edge-dev" = {
      name = "Microsoft Edge (dev)";
      genericName = "Web Browser";
      exec = ''${pkgs.microsoft-edge-dev}/bin/microsoft-edge-dev --user-data-dir="/persist/home/nate/.config/microsoft-edge-dev" %U'';  # TODO: this is a specific path
      icon = "microsoft-edge-dev";
      type = "Application";
      categories = [ "Network" "WebBrowser" ];
      startupNotify = true;
    };
  };
}
