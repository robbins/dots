# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "ohci_pci" "ehci_pci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  
  fileSystems."/" =
  { device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=500M" "mode=755" ];
  };

  fileSystems."/boot" =
    { device = lib.mkForce "/dev/disk/by-uuid/3A02-4451";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    { device = "bulldozer/local/nix";
      fsType = "zfs";
      neededForBoot = true;
    };

  fileSystems."/var/log" =
    { device = "bulldozer/system/var/log";
      fsType = "zfs";
    };

  fileSystems."/persist" =
    { device = "bulldozer/persist";
      fsType = "zfs";
      neededForBoot = true;
    };

  swapDevices = [
    { device = "/dev/disk/by-uuid/b8d71687-eceb-466d-a2af-9a9ffca1b190"; }
  ];

}
