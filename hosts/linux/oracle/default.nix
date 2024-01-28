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
    ./hardware-configuration.nix
  ];

  modules = {
    services = {
      ssh.enable = true;
      tailscale.enable = true;
    };
    user = {
      enable = true;
      hashedPasswordFile = config.age.secrets.nate_oracle_user_password.path;
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
    };
  };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = [ pkgs.git ];

  boot.kernelParams = [ "net.ifnames=0" ];

  users.users."root".hashedPasswordFile = config.age.secrets.root_oracle_user_password.path;

  # Meta
  system.stateVersion = "24.05";
}
