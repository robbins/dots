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
    user.enable = true;
    hardware = {
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
}
