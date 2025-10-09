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
    services = {
      ssh.enable = true;
      persistence.system.enable = true;
    };
    user = {
      enable = true;
      password = "1";
    };
    hardware = {
      networking = {
        enable = false;
      };
      filesystems = {
        enable = true;
        zfs = {
          enable = true;
          unstable = true;
          hostId = "2ad3fe49";
        };
      };
    };
  };

  boot = {
    initrd = {
      verbose = true;
      systemd.enable = true;
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

  disko.devices = import ./disko.nix { inherit lib; };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users."root".password = "1";
  boot.supportedFilesystems = [ "zfs" ];

  # Meta
  system.stateVersion = "25.11";
}
