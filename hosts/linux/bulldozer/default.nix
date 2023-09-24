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
}: {
  imports = [
  ];

  modules = {
    services.ssh.enable = true;
    user = {
      enable = true;
      hashedPasswordFile = ./password;
    };
    hardware = {
      filesystems = {
        enable = true;
        zfs = {
          enable = true;
          unstable = true;
          hostId = "73f6cfc9";
        };
      };
    };
  };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  # Meta
  system.stateVersion = "23.05";
}
