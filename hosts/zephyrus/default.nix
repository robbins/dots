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
    android.adb.enable = true;
    user = {
      enable = true;
      passwordFile = config.age.secrets.nate_user_password.path;
    };
    hardware = {
      audio.enable = true;
      bootloader.quiet = true;
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
      laptop.enable = true;
      nvidia.enable = true;
    };
    gui = {
      displayManager = {
        enable = true;
        autoLogin = true;
        autoSessionCommand = "Hyprland";
      };
      hyprland.enable = true;
    };
    documentation.enable = true;
  };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";
  users.defaultUserShell = pkgs.zsh;

  services.asusd = {
    enable = true;
    asusdConfig = {
      bat_charge_limit = 60;
    };
    profileConfig = ''
    active_profile = "Quiet"
    [fan_curves.balanced]
    enabled = false
    
    [fan_curves.balanced.cpu]
    fan = "CPU"
    pwm = [20, 25, 45, 51, 71, 86, 112, 142]
    temp = [47, 50, 53, 57, 61, 66, 70, 98]
    
    [fan_curves.balanced.gpu]
    fan = "GPU"
    pwm = [20, 25, 45, 51, 71, 86, 112, 142]
    temp = [47, 50, 53, 57, 61, 66, 70, 98]
    
    [fan_curves.performance]
    enabled = false
    
    [fan_curves.performance.cpu]
    fan = "CPU"
    pwm = [35, 51, 71, 86, 102, 112, 142, 163]
    temp = [20, 48, 52, 56, 60, 64, 68, 98]
    
    [fan_curves.performance.gpu]
    fan = "GPU"
    pwm = [35, 51, 71, 86, 102, 112, 142, 163]
    temp = [20, 48, 52, 56, 60, 64, 68, 98]
    
    [fan_curves.quiet]
    enabled = false
    
    [fan_curves.quiet.cpu]
    fan = "CPU"
    pwm = [10, 20, 20, 35, 35, 51, 71, 86]
    temp = [53, 56, 56, 59, 59, 63, 67, 98]
    
    [fan_curves.quiet.gpu]
    fan = "GPU"
    pwm = [10, 20, 20, 35, 35, 51, 71, 86]
    temp = [53, 56, 56, 59, 59, 63, 67, 98]
    '';
  };

  # Meta
  system.stateVersion = "21.05";
}
