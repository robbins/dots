{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
let
  cfg = config.modules.shell.direnv;
in
{
  options.modules.shell.direnv = {
    enable = lib.mkEnableOption "Enable Direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      config = {
        global = {
          strict_env = true;
        };
        whitelist = {
          prefix = [ "/home/${specialArgs.username}/src/projects" ];
        };
      };
    };
  };
}
