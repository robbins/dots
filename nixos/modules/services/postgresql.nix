{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.services.postgresql;
in
{
  options.modules.services.postgresql = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable (mkMerge [
    {
      services.postgresql.enable = true;
    }

    (mkIf config.modules.services.persistence.system.enable {
      services.postgresql.dataDir = "${config.modules.services.persistence.system.persistenceRoot}/data/postgresql/${config.services.postgresql.package.psqlSchema}";
      systemd.tmpfiles.settings = {
        "persist_data_postgresql"."${config.modules.services.persistence.system.persistenceRoot}/data/postgresql".d = {
          user = "postgres";
          group = "postgres";
          mode = "0750";
        };
        "persist_data_postgresql_ver"."${config.services.postgresql.dataDir}".d = {
          user = "postgres";
          group = "postgres";
          mode = "0750";
        };
      };
    })
  ]);
}
