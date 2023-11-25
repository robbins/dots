{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.services.tailscale;
in {
  options.modules.services.tailscale = {
    enable = mkOption {default = false;};
  };
  config = mkIf cfg.enable (mkMerge [
    {
      services.tailscale = {
        enable = true;
	authKeyFile = config.age.secrets."${specialArgs.username}_${specialArgs.hostname}_tailscale_auth_key".path;
	openFirewall = true;
      };

      environment.systemPackages = with pkgs; [ tailscale ];
    }

    (mkIf config.networking.firewall.enable {
      networking.firewall = {
        # always allow traffic from the Tailscale network
        trustedInterfaces = [ "tailscale0" ];
  
        # allow SSH over the public internet
        allowedTCPPorts = [ 22 ];
      };
    })

    (mkIf config.modules.services.persistence.system.enable {
      environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
        directories = [
	  "/var/lib/tailscale"
	];
      };
    })

  ]);
}
