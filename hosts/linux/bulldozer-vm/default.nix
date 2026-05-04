#
# Where NixOS & Home-Manager modules are imported
# { ... }: part of the module system
#
{
  config,
  pkgs,
  lib,
  inputs,
  options,
  specialArgs,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  modules = {
    services = {
      ssh.enable = true;
      persistence.system.enable = true;
      tailscale.enable = true;
    };
    user = {
      enable = true;
      hashedPasswordFile = config.age.secrets.nate_bulldozer-vm_user_password.path;
      #password = "1";
    };
    hardware = {
      networking = {
        enable = false;
      };
      filesystems = {
        enable = true;
      };
    };
  };

  boot = {
    initrd = {
      verbose = true;
      systemd.enable = true;
    };
  };

  services.openssh = {
    hostKeys = [
      {
        path = "/persist/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users."root".password = "1";

  services.openproject = {
    enable = true;
    host = {
      name = "bulldozer-vm.home.arpa";
      rootPath = "/openproject";
    };
    secrets = {
      keyBaseFile = config.age.secrets.bulldozer-vm_openproject_secret_key_base.path;
    };
    environment.OPENPROJECT_HTTPS = "false";
  };

  age.secrets.bulldozer-vm_openproject_secret_key_base = {
    owner = "openproject";
    group = "openproject";
  };
  networking.firewall.allowedTCPPorts = [ 6346 8080 80 443 ];

  services.traefik = {
    enable = true;
    staticConfigOptions = {
      entryPoints = {
			  web = {
				  address = ":80";
					asDefault = true;
					#http.redirections.entrypoint = {
					#  to = "websecure";
					#	scheme = "https";
				  #};
				};
				websecure = {
				  address = ":443";
					asDefault = true;
					http.tls.certResolver = "letsencrypt";
				};
      };

			log = {
			  level = "INFO";
				filePath = "${config.services.traefik.dataDir}/traefik.log";
				format = "json";
			};

			api.dashboard = true;
			api.insecure = true;
    };
	  dynamicConfigOptions = {
		  #http.middlewares.openproject-strip-prefix.stripPrefix.prefixes = "/openproject";
		  http.routers = {
			  openproject = {
				  rule = "PathPrefix(`/openproject`)";
					#entryPoints = [ "websecure" ];
					entryPoints = [ "web" ];
					#tls.certResolver = "letsencrypt";
					service = "openproject";
					#middlewares = [ "openproject-strip-prefix" ];
				};
      };
			http.services = {
			  openproject.loadBalancer.servers = [
				  { url = "http://127.0.0.1:6346"; }
				];
			};
		};
  };

  # Meta
  system.stateVersion = "25.11";
}
