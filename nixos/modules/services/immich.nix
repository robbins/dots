{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.services.immich;
in
{
  options.modules.services.immich = {
    enable = mkOption { default = false; };
    mediaLocation = mkOption { default = "/var/lib/immich"; type = types.str; };
  };
  config = mkIf cfg.enable (mkMerge [
    {
      services.immich = {
        enable = true;
        mediaLocation = cfg.mediaLocation;
      };

      modules.services.postgresql = mkIf config.services.immich.database.enable {
        enable = true;
      };
    }

    (mkIf config.modules.services.persistence.system.enable {
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        directories = if cfg.mediaLocation == "/var/lib/immich" then [ "${cfg.mediaLocation}" ] else [];
      };
    })
  ]);
}
