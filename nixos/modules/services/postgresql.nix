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
      services.postgresql.dataDir = "/persist/data/postgresql/${config.services.postgresql.package.psqlSchema}";
    })
  ]);
}
