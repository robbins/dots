{
  config,
  pkgs,
  lib,
  ...
}: with lib;
let
  cfg = config.modules.hardware.networking.wifi;
in {
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
        "25-wireless".extraConfig = ''
          [Match]
          Name=${cfg.interfaceName}
          [Network]
          DHCP=${cfg.dhcp}
          [DHCP]
          UseDNS=false
          RouteMetric=20
        '';
      };
    }

    (mkIf config.modules.services.persistence.system.enable {
      systemd.tmpfiles.rules = [
        "L /var/lib/iwd/UofT.8021x - - - - /persist/var/lib/iwd/UofT.8021x"
        "L /var/lib/iwd/eduroam.8021x - - - - /persist/var/lib/iwd/eduroam.8021x"
        "L /var/lib/iwd/BELL289.psk - - - - /persist/var/lib/iwd/BELL289.psk"
        "L /var/lib/iwd/hedgehog_house.psk - - - - /persist/var/lib/iwd/hedgehog_house.psk"
        "L /var/lib/iwd/The\x20Spring\x20Birds.psk - - - - /persist/var/lib/iwd/The\x20Spring\x20Birds.psk"
      ];
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        files = if (cfg.persistUoftCerts) then [
          "/etc/ssl/certs/UofT.pem"
          "/etc/ssl/certs/ca_radius_2022.pem"
        ] else [];
      };
    })
  ]);
}
