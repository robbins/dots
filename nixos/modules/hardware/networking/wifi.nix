{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.hardware.networking.wifi;
in
{
  options.modules.hardware.networking.wifi = {
    enable = mkEnableOption "Wifi";
    persistUoftCerts = mkOption {
      default = false;
      type = types.bool;
    };
    interfaceName = mkOption {
      default = "";
      type = types.str;
    };
    dhcp = mkOption {
      default = "yes";
      type = types.str;
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      networking.wireless.iwd = {
        enable = true;
        settings = {
          General = {
            AddressRandomization = "network";
          };
          Network = {
            NameResolvingService = "networkd";
          };
        };
      };

      systemd.network.networks = {
        "30-wireless" = {
          matchConfig = {
            Name = "${cfg.interfaceName}";
          };
          networkConfig = {
            DHCP = "${cfg.dhcp}";
          };
          dhcpV4Config = {
            UseDNS = true;
            UseRoutes = true;
            RouteMetric = 300;
          };
        };
      };
    }

    (mkIf config.modules.services.persistence.system.enable {
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        files =
          if (cfg.persistUoftCerts) then
            [
              "/etc/ssl/certs/UofT.pem"
              "/etc/ssl/certs/ca_radius_2022.pem"
            ]
          else
            [ ];
        directories = [ "/var/lib/iwd" ];
      };
    })
  ]);
}
