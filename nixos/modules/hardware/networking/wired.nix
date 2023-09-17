{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.modules.hardware.networking.wired;
in {
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
      "30-wired".extraConfig = ''
        [Match]
        Name=${cfg.interfaceName}
        [Network]
        DHCP=${cfg.dhcp}
        [DHCP]
        UseDNS=false
        RouteMetric=30
      '';
    };

    services.udev.extraRules = ''
      SUBSYSTEM=="net", ACTION=="add", ATTRS{idVendor}=="2357", ATTRS{idProduct}=="0601", NAME="${cfg.interfaceName}"
    '';
  };
}
