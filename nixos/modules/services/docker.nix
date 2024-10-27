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
      virtualisation.docker.enable = true;
      users.users.${specialArgs.username}.extraGroups = [ "docker" ];
    }

    (mkIf config.modules.services.persistence.system.enable {
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        directories = [ "/var/lib/docker" "/var/lib/openvas" ];
      };
    })
  ]);
}
