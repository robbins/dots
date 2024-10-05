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
  imports = [
    ./hardware-configuration.nix
    "${inputs.nixpkgs-cuttlefish}/nixos/modules/programs/cuttlefish-base.nix"
  ];

  modules = {
    programs = {
      lutris.enable = false;
    };
    services = {
      distrobox.enable = true;
      virtualization.enable = false;
      docker.enable = true;
      ssh.enable = true;
      persistence.system = {
        enable = true;
        persistUserSshKeys = true;
      };
      tailscale.enable = true;
      syncthing.enable = true;
    };
    android.adb.enable = true;
    user = {
      enable = true;
      hashedPasswordFile = config.age.secrets.nate_raphael_user_password.path;
    };
    gui = {
      fonts.enable = true;
      displayManager = {
        enable = true;
        autoLogin = {
          enable = true;
          autoSessionCommand = "niri-session";
        };
      };
      niri.enable = true;
    };
    hardware = {
      audio.enable = true;
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
        wired = {
          enable = true;
          interfaceName = "enp11s0";
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

  # Cuttlefish
  programs.cuttlefish-base.enable = true;
  users.users.${specialArgs.username}.extraGroups = [
    "cvdnetwork"
    "render"
    "kvm"
    "dialout"
    "libvirtd"
  ];

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  # OSX-KVM
  #boot.kernelModules = [
  #  "vfio-pci"
  #];
  #boot.extraModprobeConfig = ''
  #  options vfio-pci ids=1002:67df,1002:aaf0,1022:43f7
  #  softdep radeon pre: vfio-pci
  #  softdep amdgpu pre: vfio-pci
  #  softdep nouveau pre: vfio-pci
  #  softdep drm pre: vfio-pci
  #'';
  #boot.kernelParams = [
  #  "iommu=pt"
  #  "amd_iommu=on"
  #  "vfio-pci.ids=1002:67df,1002:aaf0"
  #  "kvm.ignore_msrs=1"
  #  "video=vesafb:off,efifb:off"
  #  "amd_pstate=active"
  #];
  #security.pam.loginLimits = [
  #  { domain = "@kvm"; type = "soft"; item = "memlock"; value = "unlimited"; }
  #  { domain = "@kvm"; type = "hard"; item = "memlock"; value = "unlimited"; }
  #  { domain = "@libvirt"; type = "soft"; item = "memlock"; value = "unlimited"; }
  #  { domain = "@libvirt"; type = "hard"; item = "memlock"; value = "unlimited"; }
  #];
  #services.udev.extraRules = ''
  #  SUBSYSTEM=="vfio", OWNER="root", GROUP="kvm"
  #'';

  # DarwinKVM
  boot.kernelParams = [
    "amd_pstate=active"
    "video=efifb:off"
    "iommu=pt"
    # GPU passthrough
    "vfio-pci.ids=1002:67df,1002:aaf0"
  ];
  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
    qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
  };
  programs.virt-manager.enable = true;
  # GPU Passthrough
  boot.extraModprobeConfig = ''
    options vfio-pci ids=1002:67df,1002:aaf0
    softdep radeon pre: vfio-pci
    softdep amdgpu pre: vfio-pci
    softdep nouveau pre: vfio-pci
    softdep drm pre: vfio-pci
  '';
  virtualisation.libvirtd.qemu.verbatimConfig = ''
    namespaces = []
    user = "nate"
    group = "users"
    security_default_confined = 0
    cgroup_device_acl = [
    "/dev/null", "/dev/full", "/dev/zero",
    "/dev/random", "/dev/urandom",
    "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
    "/dev/rtc", "/dev/hpet", "/dev/vfio/vfio",
    "/dev/input/by-id/usb-30fa_USB_OPTICAL_MOUSE-event-mouse",
    "/dev/input/by-id/usb-BY_Tech_Usb_Gaming_Keyboard-event-kbd",
    ]
    clear_emulator_capabilities = 0
  '';
  virtualisation.libvirtd.extraConfig = ''
    unix_sock_group = "libvirtd"
    unix_sock_rw_perms = "0770"
    log_filters="3:qemu 1:libvirt"
    log_outputs="2:file:/var/log/libvirt/libvirtd.log"
  '';

  services.gvfs.enable = true;

  # Meta
  system.stateVersion = "23.05";
}
