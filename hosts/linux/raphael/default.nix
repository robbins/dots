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
      persistence.system.enable = true;
    };
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
  };

   boot = {
     initrd = {
       systemd.enable = true;
     };
   };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users."root".password = "1";
  boot.supportedFilesystems = [ "zfs" ];

  # Meta
  system.stateVersion = "23.05";
}
