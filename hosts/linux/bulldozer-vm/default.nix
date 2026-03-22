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
      tailscale.enable = true;
    };
    user = {
      enable = true;
      hashedPasswordFile = config.age.secrets.nate_bulldozer-vm_user_password.path;
      #password = "1";
    };
    hardware = {
      networking = {
        enable = false;
      };
      filesystems = {
        enable = true;
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

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users."root".password = "1";

  services.openproject = {
    enable = true;
    host.name = "bulldozer-vm.home.arpa";
    secrets = {
      keyBaseFile = config.age.secrets.bulldozer-vm_openproject_secret_key_base.path;
    };
  };

  age.secrets.bulldozer-vm_openproject_secret_key_base = {
    owner = "openproject";
    group = "openproject";
  };
  networking.firewall.allowedTCPPorts = [ 6346 ];

  # Meta
  system.stateVersion = "25.11";
}
