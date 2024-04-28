{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.services.wayvnc;
in
{
  options.modules.services.wayvnc = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable (mkMerge [
    {
      home.packages = with pkgs; [ wayvnc ];

      systemd.user.services.wayvnc = {
        Unit = {
          Description = "WayVNC Server";
        };
        Install = {
          WantedBy = [ "hyprland-session.target" ];
        };
        Service = {
          ExecStart = "${pkgs.wayvnc}/bin/wayvnc";
        };
      };

      # As we don't open the firewall, it should only be accessible over Tailscale
      xdg.configFile."wayvnc/config".text = ''
        address=0.0.0.0
      '';
    }
  ]);
}
