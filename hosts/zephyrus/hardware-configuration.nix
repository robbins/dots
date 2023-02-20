# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  services.logind.extraConfig = ''
    RuntimeDirectorySize=12G
  '';

  boot.kernelPatches = [
  ];

  fileSystems."/" =
    { device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=1G" "mode=755" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/9094-11AD";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    { device = "zephyrus/local/nix";
      fsType = "zfs";
      neededForBoot = true;
#      options = [ "zfsutil" ];
    };

  fileSystems."/persist" =
    { device = "zephyrus/persist";
      fsType = "zfs";
      neededForBoot = true;
      options = [ "defaults" "user" "zfsutil" ];
    };

  fileSystems."/root" =
    { device = "zephyrus/data/home/root";
      fsType = "zfs";
#      options = [ "zfsutil" ];
    };

  fileSystems."/home/nate" =
    { #device = "zephyrus/data/home/nate";
      #fsType = "zfs";
      device = "none";
      fsType = "tmpfs"; 
      options = [ "defaults" "size=1G" "mode=755" "uid=1000" "gid=100" ];
    };

  fileSystems."/var/log" =
    { device = "zephyrus/system/var/log";
      fsType = "zfs";
#      options = [ "zfsutil" ];
    };

  fileSystems."/tmp" = 
  { device = "zephyrus/system/tmp";
    fsType = "zfs";
    options = [ "zfsutil" ];
  };

  fileSystems."/home/nate/data" =
  { device = "zephyrus/data";
    fsType = "zfs";
    options = [ "zfsutil" "X-mount.mkdir" ];
  };

  fileSystems."/backups" =
  { device = "zephyrus/data/backups";
    fsType = "zfs";
    options = [ "zfsutil" ];
  };

  fileSystems."/games" =
    { device = "zephyrus/data/games";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

  fileSystems."/home/nate/src" =
    { device = "zephyrus/data/src";
      fsType = "zfs";
      options = [ "zfsutil" "X-mount.mkdir" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/d362f8f9-b9d4-4840-b74e-feea4c66ecbd"; }
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}