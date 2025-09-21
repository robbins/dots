{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.services.docker;
in
{
  options.modules.services.docker = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable (mkMerge [
    {
      virtualisation.docker = {
        enable = false;
        rootless = {
          enable = true;
          setSocketVariable = true;
          daemon.settings = {
            dns = ["1.1.1.1"];
            storage-driver = "overlay2"; # ZFS not supported by rootless
            data-root = "/var/lib/docker";
          };
        };
      };
    }

    (mkIf config.modules.services.persistence.system.enable {
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        directories = [];
      };
    })
  ]);
}
