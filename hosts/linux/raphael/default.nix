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
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  modules = {
    services = {
      ssh.enable = true;
      persistence.system = {
        enable = true;
	persistUserSshKeys = true;
      };
      tailscale.enable = true;
    };
    android.adb.enable = true;
    user = {
      enable = true;
      hashedPasswordFile = config.age.secrets.nate_raphael_user_password.path;
    };
    gui = {
      displayManager = {
        enable = true;
	autoLogin = {
	  enable = true;
	  autoSessionCommand = "Hyprland";
	};
      };
      hyprland.enable = true;
    };
    hardware = {
      bootloader = {
        quiet = false;
	sshInitrd = true;
      };
      networking = {
        enable = true;
	wifi = {
	  enable = true;
          interfaceName = "wlan0";
          dhcp = "ipv4";
	};
      };
      filesystems = {
        enable = true;
        zfs = {
          enable = true;
          unstable = true;
          hostId = "e5146782";
        };
      };
    };
    documentation.enable = true;
  };

  boot.kernelParams = [ "amd_pstate=active" ];

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users."root".password = "1";

  # Sunshine TODO
  environment.systemPackages = [ pkgs.sunshine ];

  security.wrappers.sunshine = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+p";
    source = "${pkgs.sunshine}/bin/sunshine";
  };

  systemd.user.services.sunshine = {
    description = "sunshine";
    wantedBy = [ "graphical-session.target" ];
    startLimitIntervalSec = 500;
    startLimitBurst = 5;
    serviceConfig = {
      ExecStart = "${config.security.wrapperDir}/sunshine";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 47984 47989 47990 48010 ];
    allowedUDPPorts = [ 47998 47999 48000 48002 ];
  };

  boot.kernelModules = [ "uinput" ];
  services.udev.extraRules = ''
    KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"
  '';

  systemd.packages = with pkgs; [ sunshine ];

  # Meta
  system.stateVersion = "23.05";
}
