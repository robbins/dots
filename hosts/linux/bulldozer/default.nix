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
      hashedPasswordFile = builtins.toString(./. + "/password");
    };
    hardware = {
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

  boot.initrd.systemd.enable = true;

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
