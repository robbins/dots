{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.services.tailscale;
in
{
  options.modules.services.tailscale = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable (mkMerge [
    {
      services.tailscale = {
        enable = true;
        authKeyFile = config.age.secrets."global_tailscale_auth_key".path;
        openFirewall = true;
      };

      services.openssh.openFirewall = false;

      environment.systemPackages = [ pkgs.tailscale ];
    }

    (mkIf config.modules.services.persistence.system.enable {
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        directories = [ "/var/lib/tailscale" ];
      };
    })
  ]);
}
