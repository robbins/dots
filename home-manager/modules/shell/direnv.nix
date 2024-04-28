{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.modules.shell.direnv;
in
{
  options.modules.shell.direnv = {
    enable = lib.mkEnableOption "enable";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
