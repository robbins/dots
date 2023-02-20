{ config, pkgs, lib, ... }:

let cfg = config.modules.hardware.networking.usbTether;
in {
  options.modules.hardware.networking.usbTether = { 
    enable = lib.mkEnableOption "USB Tethering"; 
    interfaceName = lib.mkOption { default = ""; type = lib.types.str; };
    dhcp = lib.mkOption { default = "yes"; type = lib.types.str; };
  };

  config = lib.mkIf cfg.enable {
    systemd.network.networks = {
      "20-usbtether0".extraConfig = ''
        [Match]
        Name=${cfg.interfaceName}
        [Network]
        DHCP=${cfg.dhcp}
        [DHCP]
        UseDNS=false
        RouteMetric=10
      '';
    };
    services.udev.extraRules = ''
      SUBSYSTEM=="net", ACTION=="add", ATTRS{idVendor}=="2a70", ATTRS{idProduct}=="9024", NAME="${cfg.interfaceName}"
    '';
  };
}
