{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.modules.hardware.networking.wired;
in
{
  options.modules.hardware.networking.wired = {
    enable = lib.mkEnableOption "Wired";
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
      "10-wired" = {
        matchConfig = {
          Name = "${cfg.interfaceName}";
        };
        networkConfig = {
          DHCP = "${cfg.dhcp}";
        };
        dhcpV4Config = {
          UseDNS = false;
          UseRoutes = true;
          RouteMetric = 100;
        };
      };
    };

    services.udev.extraRules = ''
      SUBSYSTEM=="net", ACTION=="add", ATTRS{idVendor}=="2357", ATTRS{idProduct}=="0601", NAME="${cfg.interfaceName}"
    '';
  };
}
