{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
let
  inherit (lib) mkOption mkIf mkMerge;
  cfg = config.modules.programs.lutris;
in
{
  options.modules.programs.lutris = {
    enable = mkOption { default = false; };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      hardware.opengl.driSupport32Bit = true;
      environment.systemPackages = [
        pkgs.lutris
      ];
    }

    (mkIf config.modules.services.persistence.system.enable {
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        users."${specialArgs.username}" = {
          directories = [ ".local/share/lutris" ];
        };
      };
    })
  ]);
}
