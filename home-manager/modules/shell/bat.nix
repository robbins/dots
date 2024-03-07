{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.shell.bat;
in {
  options.modules.shell.bat = {
    enable = mkEnableOption "enable";
  };

  config = mkIf cfg.enable {
    programs.zsh.shellAliases = {
      "bap" = "bat -pp";
    };
    programs.bat = {
      enable = true;
      config = {
        theme = "gruvbox-dark";
      };
    };
  };
}
