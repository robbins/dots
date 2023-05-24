{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.shell.git;
in {
  options.modules.shell.git = { 
    enable = mkEnableOption "enable"; 
    userName = mkOption { type = lib.types.str; default = ""; };
    userEmail = mkOption { type = lib.types.str; default = ""; };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
      delta.enable = true;
      extraConfig = {
        http = {
	  cookiefile = "/home/nate/.gitcookies";
	};
      };
    };
  };
}
