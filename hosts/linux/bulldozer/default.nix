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
    services.ssh.enable = true;
    user = {
      enable = true;
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
          hostId = "73f6cfc9";
        };
      };
    };
  };

   boot = {
     initrd = {
       systemd.enable = true;
       network = {
         enable = true;
	 ssh = {
	   enable = true;
	   port = 2222;
	   hostKeys = [ /persist/ssh/ssh_host_ed25519_key ];
	   authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOhDWqWzxiIGz/UBCfXPisWKVkCrOy0YTpzpn12e2qdq" ];
	 };
       };
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

  /*boot.initrd.systemd.services.rollback = {
    description = "Rollback ZFS datasets to a pristine state";
    serviceConfig.Type = "oneshot";
    unitConfig.DefaultDependencies = "no";
    wantedBy = [
      "initrd.target"
    ];
    after = [
      "zfs-import-bulldozer.service"
    ];
    before = [
      "sysroot.mount"
    ];
    path = with pkgs; [
      zfs
    ];
    script = ''
      set -ex
      zfs rollback -r bulldozer/system/root@blank && echo "rollback complete"
    '';
  };*/
  
  /*boot.initrd.postDeviceCommands = lib.mkAfter ''
   zfs rollback -r bulldozer/system/root@blank
 '';*/


  disko.devices = import ./disko.nix {
    inherit lib;
  };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users."root".password = "1";
  boot.supportedFilesystems = [ "zfs" ];

  # Meta
  system.stateVersion = "23.05";
}
