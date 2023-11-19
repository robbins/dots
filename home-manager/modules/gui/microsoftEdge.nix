{
  config,
	osConfig ? {},
  pkgs,
  lib,
	specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.gui.microsoftEdge;
in {
  options.modules.gui.microsoftEdge = {
    enable = mkEnableOption "Microsoft Edge";
  };

  config = mkIf cfg.enable (mkMerge [
  	{
  	  home.packages = [pkgs.microsoft-edge-dev];
  	  xdg.desktopEntries."microsoft-edge-dev" = {
  	    name = "Microsoft Edge (dev)";
  	    genericName = "Web Browser";
  	    exec = ''${pkgs.microsoft-edge-dev}/bin/microsoft-edge-dev --user-data-dir="${osConfig.modules.services.persistence.system.persistenceRoot}/home/${specialArgs.username}/.config/microsoft-edge-dev" %U''; # TODO only do this if impermanence is enabled
  	    icon = "microsoft-edge-dev";
  	    type = "Application";
  	    categories = ["Network" "WebBrowser"];
  	    startupNotify = true;
  	  };
  	  programs.zsh.shellAliases = {
  	    microsoft-edge-dev = "microsoft-edge-dev --user-data-dir=${osConfig.modules.services.persistence.system.persistenceRoot}/home/${specialArgs.username}/.config/microsoft-edge-dev";
  	  };
  	}
	]);
}
