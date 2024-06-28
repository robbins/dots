{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.services.distrobox;
in
{
  options.modules.services.distrobox = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable (mkMerge [
    {
      environment.systemPackages = [ pkgs.distrobox ];
      virtualisation.podman = {
        enable = true;
      };
    }

    (mkIf config.modules.services.persistence.system.enable {
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        users."${specialArgs.username}" = {
          directories = [ ".local/share/containers" ".espressif" ];
        };
      };
    })
  ]);
}
