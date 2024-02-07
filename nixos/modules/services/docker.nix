{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.services.docker;
in {
  options.modules.services.docker = {
    enable = mkOption {default = false;};
  };
  config = mkIf cfg.enable (mkMerge [
    {
      virtualisation.docker.enable = true;
      virtualisation.docker.rootless = {
        enable = true;
        setSocketVariable = true;
      };
    }
  ]);
}
