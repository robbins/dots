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
  imports = [
    ./hardware-configuration.nix
    # ../../../nixos/agenix.nix
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga401
  ];

  modules = {
    services = {
      docker.enable = true;
      ssh.enable = true;
      persistence.system = {
        enable = true;
        persistUserSshKeys = true;
      };
      virtualization.enable = false;
      syncthing.enable = true;
      tailscale.enable = true;
    };
    android.adb.enable = true;
    user = {
      enable = true;
      hashedPasswordFile = config.age.secrets.nate_zephyrus_user_password.path;
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
      fonts.enable = true;
      displayManager = {
        enable = true;
        autoLogin = {
          enable = true;
          autoSessionCommand = "niri-session";
        };
        gnome = false;
        kde = false;
      };
      niri.enable = true;
      hyprland.enable = false;
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
  boot.kernelParams = [ "amd_pstate=active" ];

  # Access built-in display backlight without root
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl1", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl0", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
  '';

  security.pam.services.hyprlock = { };

  services.auto-epp = {
    enable = true;
    settings.Settings = {
      epp_state_for_BAT = "power";
      epp_state_for_AC = "performance";
    };
  };

  fonts.fontconfig.subpixel.rgba = "rgb";

  # Meta
  system.stateVersion = "21.05";

  users.users.${specialArgs.username}.extraGroups = [
    "kvm"
    "dialout"
    "wireshark"
  ];
  programs.ssh.extraConfig = ''
   Host 192.168.2.2
     IdentitiesOnly yes
     IdentityFile /home/${specialArgs.username}/.ssh/id_rsa_brocade
     KexAlgorithms +diffie-hellman-group1-sha1
     PubkeyAcceptedKeyTypes=+ssh-rsa
     HostKeyAlgorithms=+ssh-rsa
  '';
  environment.systemPackages = [
    specialArgs.pkgs-ghostty.ghostty
    pkgs.saleae-logic-2
  ];
  hardware.saleae-logic = {
    enable = true;
  };
  boot.binfmt.emulatedSystems = ["aarch64-linux" "armv7l-linux"];
  programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs.pkgsCross.armv7l-hf-multiplatform; [
    stdenv.cc.cc.lib
    glibc
  ] ++ [
      pkgs.avahi-compat
      pkgs.avahi-compat.dev
    ];
  services.avahi.enable = true;
  programs.wireshark.enable = true;
  programs.ghidra.enable = true;
}
