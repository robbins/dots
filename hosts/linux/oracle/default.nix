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
      tailscale.enable = true;
      persistence.system.enable = true;
    };
    user = {
      enable = true;
      #hashedPasswordFile = config.age.secrets.nate_oracle_user_password.path;
      password = "1";
    };
    hardware = {
      bootloader = {
        quiet = false;
      };
      networking = {
        enable = true;
        wired = {
          enable = true;
          interfaceName = "eth0";
        };
      };
      filesystems = {
        enable = true;
        zfs = {
          enable = true;
          unstable = true;
          hostId = "8425e349";
        };
      };
    };
  };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = [
    pkgs.git
    pkgs.vim
  ];

  boot.kernelParams = [ "net.ifnames=0" ];

  #users.users."root".hashedPasswordFile = config.age.secrets.root_oracle_user_password.path;
  users.users."root".password = "1";

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHpHAd+0vlQ+gPFdDU4wejyMwtU0SF51vBmSOCJ2jeJzIritamOobMePc5b7sFAdqSlwkgCYdZu8ghF6fLmsEiVonl3WNoDoblTM2yKeDbyomAYBzYNzb68wTaMbjudFnDKOLwL6/zUrYFWzvzwXa8NPxSBW0ReYTpASwPPPRnOEerm4ktzWwZX402RCJQ59kSijhVa9wlNxztG/9j1Hc4HZc28Z5VMihZSYnazb2q0vtZaaUtzNds1WkDmRiDOYJM1oRQPMBzvjUklpXOWi+qVcNckTiUBDi9MClgWOmp2U/DRnt6gfoVhK26qtowzO8+iOrHkVsTdskGJ6oPLAWp ssh-key-2024-01-28"
  ];

  # Meta
  system.stateVersion = "24.05";
}
