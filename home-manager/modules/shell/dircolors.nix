{ config, pkgs, lib, ... }:

let cfg = config.modules.shell.dircolors;
in {
  options.modules.shell.dircolors = { 
    enable = lib.mkEnableOption "enable"; 
  };

  config = lib.mkIf cfg.enable {
    programs.dircolors.enable = true;
  };
}
