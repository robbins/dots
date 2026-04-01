{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.modules.hardware.networking.usbTether;
in
{
  options.modules.hardware.networking.usbTether = {
    enable = lib.mkEnableOption "USB Tethering";
    interfaceName = lib.mkOption {
      default = "";
      type = lib.types.str;
    };
    dhcp = lib.mkOption {
      default = "yes";
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.network.networks = {
      "20-usbtether0" = {
        matchConfig = {
          Name = "${cfg.interfaceName}";
        };
        networkConfig = {
          DHCP = "${cfg.dhcp}";
        };
        dhcpV4Config = {
          UseDNS = true;
          UseRoutes = true;
          RouteMetric = 200;
        };
      };
    };
    services.udev.extraRules = ''
      SUBSYSTEM=="net", ACTION=="add", ATTRS{idVendor}=="2a70", ATTRS{idProduct}=="9024", NAME="${cfg.interfaceName}"
      SUBSYSTEM=="net", ACTION=="add", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="8153", NAME="${cfg.interfaceName}"
    '';
  };
}
