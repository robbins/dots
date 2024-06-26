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
  imports = [ inputs.wsl.nixosModules.wsl ];

  #TODO: mutableusers = false, set nate password with agenix, set a root password (currently none)

  modules = {
    android.adb.enable = true;
    documentation.enable = true;
    services = {
      ssh.enable = true;
      tailscale.enable = true;
      syncthing.enable = true;
    };
  };

  # Misc
  wsl = {
    enable = true;
    defaultUser = "nate";
  };

  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  # Meta
  system.stateVersion = "21.05";
}
