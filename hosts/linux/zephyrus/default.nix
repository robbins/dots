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
    # ../../../nixos/agenix.nix
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga401
  ];

  modules = {
    services = {
      ssh.enable = true;
      persistence.system = {
        enable = true;
        persistUserSshKeys = true;
      };
      virtualization.enable = true;
      syncthing.enable = true;
      tailscale.enable = true;
    };
    android.adb.enable = true;
    user = {
      enable = true;
      password = "1";
      #hashedPasswordFile = config.age.secrets.nate_user_password.path; 
    };
    hardware = {
      audio = {
        enable = true;
        bluetooth.enable = true;
      };
      bootloader.quiet = true;
      networking = {
        enable = true;
        wifi = {
          enable = true;
          interfaceName = "wlan0";
          dhcp = "ipv4";
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
      };
      laptop.enable = true;
      nvidia.enable = true;
    };
    gui = {
      displayManager = {
        enable = true;
        autoLogin = {
          enable = true;
          autoSessionCommand = "Hyprland";
        };
        gnome = false;
        kde = false;
      };
      hyprland.enable = true;
    };
    documentation.enable = true;
  };

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  services.asusd = {
    enable = true;
    asusdConfig = ''
      (
      bat_charge_limit: 60,
      panel_od: false,
      disable_nvidia_powerd_on_battery: true,
      ac_command: "",
      bat_command: "",
      )
    '';
  };

  # Guided Autonomous Mode
  boot.kernelParams = ["amd_pstate=active"];

  # Access built-in display backlight without root
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl1", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl0", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
  '';

  security.pam.services.swaylock = {};

  services.auto-epp = {
    enable = true;
    settings.Settings = {
      epp_state_for_BAT = "power";
      epp_state_for_AC = "performance";
    };
  };

  # Meta
  system.stateVersion = "21.05";
}
