#
# Where NixOS & Home-Manager modules are imported
# { ... }: part of the module system
#

{ config, pkgs, lib, inputs, specialArgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga401
  ];

  modules = {
    services.ssh.enable = true;
    services.persistence.system.enable = true;
    user = {
      enable = true;
      passwordFile = config.age.secrets.nate_user_password.path;
    };
    hardware = {
      networking = {
        enable = true;
        wifi = {
          enable = true;
          interfaceName = "wlan0";
          dhcp = "yes";
        };
        wired = {
          enable = true;
          interfaceName = "usbethernet";
        };
        usbTether = {
          enable = true;
          interfaceName = "usbtether0";
        };
      };
      filesystems = {
        enable = true;
        zfs = {
          enable = true;
          unstable = true;
          hostId = "aabbccdd";
        };
      };
    };
  };

  # Meta
  system.stateVersion = "21.05";
}
