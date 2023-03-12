{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.dev.shell;
in {
  options.modules.dev.shell = { 
    enable = lib.mkEnableOption "Shell Development"; 
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      shellcheck
    ];
  };
}
