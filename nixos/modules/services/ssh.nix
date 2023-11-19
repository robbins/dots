{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.services.ssh;
in {
  options.modules.services.ssh = {
    enable = mkOption {default = false;};
  };
  config = mkIf cfg.enable (mkMerge [
		{
  	  services.openssh = {
  	    enable = true;
  	    settings = {
  	      PasswordAuthentication = false;
  	    };
  	  };
  	}

		(mkIf config.modules.services.persistence.system.enable {
			environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
				files = [
          "/etc/ssh/ssh_host_rsa_key"
          "/etc/ssh/ssh_host_rsa_key.pub"
          "/etc/ssh/ssh_host_ed25519_key"
          "/etc/ssh/ssh_host_ed25519_key.pub"
					# TODO generate these keys with nix, need to rekey secrets so todo
				];
			};
		})

	]);
}
