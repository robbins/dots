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
      docker.enable = false;
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
          interfaceName = "enp10s0";
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
  ];

  # Misc
  boot.kernelParams = [ "amd_pstate=active" ];
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  # Meta
  system.stateVersion = "23.05";
}
