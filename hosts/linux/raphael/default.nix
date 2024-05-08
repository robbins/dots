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
  imports = [ ./hardware-configuration.nix ];

  modules = {
    programs = {
      lutris.enable = false;
    };
    services = {
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

  # Meta
  system.stateVersion = "23.05";
}
