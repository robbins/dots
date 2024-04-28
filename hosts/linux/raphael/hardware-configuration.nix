# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "ahci"
    "xhci_pci"
    "nvme"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  services.logind.extraConfig = ''
    RuntimeDirectorySize=12G
  '';

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [
      "defaults"
      "size=500M"
      "mode=755"
    ];
  };

  fileSystems."/home/nate" = {
    device = "none";
    fsType = "tmpfs";
    options = [
      "defaults"
      "size=500M"
      "mode=755"
      "uid=1000"
      "gid=100"
    ];
    neededForBoot = true;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/5E6A-A5C9";
    fsType = "vfat";
  };

  fileSystems."/nix" = {
    device = "raphael/local/nix";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/var/log" = {
    device = "raphael/system/var/log";
    fsType = "zfs";
  };

  fileSystems."/persist" = {
    device = "raphael/persist";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/aosp" = {
    device = "/dev/nvme0n1p4";
    fsType = "ext4";
    options = [
      "noatime"
      "commit=60"
    ];
  };

  fileSystems."/vault" = {
    device = "vault";
    fsType = "zfs";
  };

  fileSystems."/home/nate/src" = {
    device = "raphael/user/home/nate/src";
    fsType = "zfs";
  };

  fileSystems."/home/nate/data" = {
    device = "raphael/user/home/nate/data";
    fsType = "zfs";
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/bda5f1d0-82d0-4b98-bddc-19a11263aac5"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp11s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp8s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
