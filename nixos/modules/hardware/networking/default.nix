{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.modules.hardware.networking;
in {
  imports = [
    ./usbTether.nix
    ./wifi.nix
    ./wired.nix
  ];

  options.modules.hardware.networking = {
    enable = lib.mkEnableOption "Networking";
  };

  config = lib.mkIf cfg.enable {
    networking = {
      useDHCP = false;
      useNetworkd = true;
    };
    services.resolved = {
      enable = true;
      dnssec = "false";
      domains = ["~."];
      extraConfig = ''
        DNS=1.1.1.1#1dot1dot1dot1.cloudflare-dns.com
        DNSOverTLS=yes
      '';
    };
  };
}
