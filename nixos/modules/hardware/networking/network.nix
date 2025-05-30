{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.modules.hardware.networking;
in
{
  imports = [
    ./usbTether.nix
    ./wifi.nix
    ./wired.nix
  ];

  options.modules.hardware.networking = {
    enable = lib.mkEnableOption "Networking";
  };

  config = lib.mkIf cfg.enable {
    systemd.network = {
      enable = true;
    };
    networking = {
      useDHCP = false;
      useNetworkd = true;
      hosts = {
        "192.168.2.175" = [ "oneplus7pro" ];
      };
    };
    services.resolved = {
      enable = true;
      #dnssec = "false";
      #domains = [ "~." ];
      #extraConfig = ''
      #  DNS=1.1.1.1#1dot1dot1dot1.cloudflare-dns.com
      #  DNSOverTLS=yes
      #'';
    };
  };
}
