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
      hashedPasswordFile = config.age.secrets.nate_bulldozer_user_password.path;
    };
    hardware = {
      networking = {
        enable = false;
      };
      filesystems = {
        enable = true;
        zfs = {
          enable = true;
          unstable = true;
          hostId = "2ad3fe49";
        };
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

  disko.devices = import ./disko.nix { inherit lib; };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users."root".password = "1";
  boot.supportedFilesystems = [ "zfs" ];

  # Asterisk
  services.asterisk = {
    enable = true;
    extraConfig = ''
    '';
    confFiles = {
      "logger.conf" = ''
        console => notice,warning,error,debug
      '';
      "extensions.conf" = ''
        ; Hello World extension for debugging
        [from-internal]
        exten => 100,1,Answer()
        same = n,Wait(1)
        same = n,Playback(hello-world)
        same = n,Hangup()

	  ; Nate
	  exten => 1001,1,Dial(PJSIP/nate-softphone)
	  
	  ; Indoor Station
	  exten => 1002,1,Dial(PJSIP/6969)

	  ; Doorbell
	  exten => 1003,1,Dial(PJSIP/doorbell)
      '';
      "pjsip.conf" = ''
        ; Transport
        [transport-udp]
        type=transport
        protocol=udp
        bind=0.0.0.0

        ; Nate
        [nate-softphone]
	  type=endpoint
	  context=from-internal
	  disallow=all
	  allow=opus
	  auth=nate-auth
	  aors=nate-softphone

	  [nate-auth]
	  type=auth
	  auth_type=userpass
	  username=nate-softphone
	  password=password

	  [nate-softphone]
	  type=aor
	  max_contacts=1

	  ; Indoor Station
	  [6969]
	  type=endpoint
	  context=from-internal
	  disallow=all
	  allow=ulaw
	  auth=indoor-station-auth
	  aors=6969

	  [indoor-station-auth]
	  type=auth
	  auth_type=userpass
	  username=indoor-station
	  password=password

	  [6969]
	  type=aor
	  max_contacts=1

	  ; Doorbell
	  [doorbell]
	  type=endpoint
	  context=from-internal
	  disallow=all
	  allow=ulaw
	  auth=doorbell-auth
	  aors=doorbell

	  [doorbell-auth]
	  type=auth
	  auth_type=userpass
	  username=doorbell
	  password=password

	  [doorbell]
	  type=aor
	  max_contacts=1
      '';
    };
  };

  # Grafana
  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "127.0.0.1";
        http_port = 9000;
        enforce_domain = false;
        enable_gzip = true;
        domain = "localhost";

        # Alternatively, if you want to serve Grafana from a subpath:
        # domain = "your.domain";
        # root_url = "https://your.domain/grafana/";
        # serve_from_sub_path = true;
      };

      # Prevents Grafana from phoning home
      analytics.reporting_enabled = false;
    };
  };

  services.prometheus = {
    enable = true;
    port = 9001;
    globalConfig.scrape_interval = "10s";
    exporters = {
      collectd = {
        enable = true;
        logLevel = "debug";
        port = 9101;
        extraFlags = let
          typesDb = pkgs.writeText "types.db" (builtins.readFile ./types.db);
        in [ "--collectd.typesdb-file=${typesDb}" ];
        collectdBinary = {
          enable = true;
          port = 10001;
          securityLevel = "None";
        };
      };
    };
    scrapeConfigs = [{
      job_name = "collectd";
        static_configs = [{
          targets = [ "localhost:${toString config.services.prometheus.exporters.collectd.port}" ];
        }];
    }];
  };
  networking.firewall.allowedTCPPorts = [ 9000 9001 ];

  # Meta
  system.stateVersion = "25.11";
}
