{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.shell.bat;
in
{
  options.modules.shell.bat = {
    enable = mkEnableOption "enable";
  };

  config = mkIf cfg.enable {
    programs.zsh.shellAliases = {
      "bap" = "bat -pp";
      "bag" = "batdiff";
      "bad" = "batdiff";
    };
    programs.zsh.localVariables = {
      MANPAGER = "${pkgs.bash}/bin/sh -c '${pkgs.util-linux}/bin/col -bx | ${pkgs.bat}/bin/bat -l ${pkgs.man}/share/man -p'";
    };
    programs.zsh.shellGlobalAliases = {
      "-h" = "-h 2>&1 | bat --language=help --style=plain";
      "--help" = "--help 2>&1 | bat --language=help --style=plain";
    };
    programs.bat = {
      enable = true;
      # TODO: Batdiff tests currently broken
      extraPackages = with pkgs.bat-extras; [ batgrep ];
      config = {
        theme = "gruvbox-dark";
      };
    };
  };
}
