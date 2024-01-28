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
      password = "1";
    };
    hardware = {
      bootloader = {
        quiet = false;
      };
      networking = {
        enable = true;
      };
    };
    documentation.enable = true;
  };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users."root".password = "1";

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOcd/WE20SqfclDs2+paJxcNq0pJD8JfMyyy9W3JlihBGuhvCmqBrYPZChxGw0NqhjcCH5X/AxSLPACggs/Z9R34cPKDvjkMiMaJX8aWRs34Xut9qaRt36zLarhTY4HaGKoxvuCrdU5sHO+pQhwaw7gb8OJikLCh3Fp+w25bbVEEwHTUIfoqMmD/HibSS0DMFwPLGVP7kUhjyF6FgIF4nTLJixgvBbk9WT531zV+A1+ZXujJwYYgA7BoqlgIHBVWWkRG5pj7Mh2ua9rJpkOgucu2oo4hfr+AuEupoTgJ449cDI2J5Gd8yvkcnSGInjf9ftzmFQrOkFAK1pgHlf0UNV ssh-key-2024-01-13"

  networking.firewall.enable = false;
  environment.systemPackages = [ pkgs.git ];
  boot.kernelParams = [ "net.ifnames=0" ];
  ];

  # Meta
  system.stateVersion = "24.05";
}
