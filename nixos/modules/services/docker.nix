{
  config,
  pkgs,
  lib,
  specialArgs,
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
      users.users.${specialArgs.username}.extraGroups = [ "docker" ];
    }
  ]);
}
