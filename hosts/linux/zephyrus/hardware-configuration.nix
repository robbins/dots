# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "none";
      fsType = "tmpfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D199-7B09";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/7f47d7c2-3824-4137-b72e-2c612448968e";
      fsType = "btrfs";
      neededForBoot = true;
      options = [ "subvol=nix" "noatime" "discard" "compress-force=zstd:1" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/7f47d7c2-3824-4137-b72e-2c612448968e";
      fsType = "btrfs";
      options = [ "subvol=var/log" "noatime" "discard" "compress-force=zstd:1" ];
    };

  fileSystems."/root" =
    { device = "/dev/disk/by-uuid/7f47d7c2-3824-4137-b72e-2c612448968e";
      fsType = "btrfs";
      options = [ "subvol=root" "noatime" "discard" "compress-force=zstd:1" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/7f47d7c2-3824-4137-b72e-2c612448968e";
      fsType = "btrfs";
      neededForBoot = true;
      options = [ "subvol=persist" "noatime" "discard" "compress-force=zstd:1" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/90a19cb3-718c-4a6c-a07a-24490b2be093"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
