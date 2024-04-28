{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.android.adb;
in
{
  options.modules.android.adb = {
    enable = mkEnableOption "enable";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      programs.adb.enable = true;
      users.users.${specialArgs.username}.extraGroups = [ "adbusers" ];
    }

    (mkIf config.modules.services.persistence.system.enable {
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        users."${specialArgs.username}" = {
          directories = [ ".android" ];
        };
      };
    })
  ]);
}
