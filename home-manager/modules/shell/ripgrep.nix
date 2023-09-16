{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.shell.ripgrep;
in {
  options.modules.shell.ripgrep = { 
    enable = mkEnableOption "enable"; 
  };

  config = mkIf cfg.enable {
    programs.ripgrep = {
      enable = true;
      arguments = [
        "--smart-case"
	"--hidden"
	"--max-columns=150"
	"--max-columns-preview"
	"--colors=line:style:bold"
      ];
    };
  };
}
