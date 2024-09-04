{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.dev.shell;
in
{
  options.modules.dev.shell = {
    enable = mkEnableOption "Bash Scripting Utilities";
  };

  config = mkIf cfg.enable { home.packages = with pkgs; [ shellcheck shellharden shfmt ]; };
}
