{ config, pkgs, lib, ... }:

let cfg = config.modules.hardware.networking.wifi;
in {
  options.modules.hardware.networking.wifi = { 
    enable = lib.mkEnableOption "enable"; 
    interfaceName = lib.mkOption { default = ""; type = lib.types.str; };
    dhcp = lib.mkOption { default = "yes"; type = lib.types.str; };
  };

  config = lib.mkIf cfg.enable {
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

    systemd.network.networks = { #TODO: cant use ${} for interface and dhcp for some reason
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
  };
}
