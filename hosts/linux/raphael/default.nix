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
    programs = {
      lutris.enable = false;
    };
    services = {
      distrobox.enable = true;
      virtualization.enable = false;
      docker.enable = false;
      ssh.enable = true;
      persistence.system = {
        enable = true;
        persistUserSshKeys = true;
      };
      tailscale.enable = true;
      syncthing.enable = true;
    };
    android.adb.enable = true;
    user = {
      enable = true;
      hashedPasswordFile = config.age.secrets.nate_raphael_user_password.path;
    };
    gui = {
      fonts.enable = true;
      displayManager = {
        enable = true;
        autoLogin = {
          enable = true;
          autoSessionCommand = "niri-session";
        };
      };
      niri.enable = true;
    };
    hardware = {
      audio.enable = true;
      bootloader = {
        quiet = false;
        sshInitrd = true;
      };
      networking = {
        enable = true;
        wifi = {
          enable = true;
          interfaceName = "wlan0";
          dhcp = "ipv4";
        };
        wired = {
          enable = true;
          interfaceName = "enp10s0";
        };
      };
      filesystems = {
        enable = true;
        zfs = {
          enable = true;
          unstable = true;
          hostId = "e5146782";
        };
      };
    };
    documentation.enable = true;
  };

  boot.kernelParams = [ "amd_pstate=active" ];

  # Misc
  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users."root".password = "1";

  # /etc/security/limits.d/1_cuttlefish.conf
    security.pam.loginLimits = [
      {
        domain = "@cvdnetwork";
        item = "nofile";
        type = "soft";
        value = "4096";
      }
    ];

    # /etc/modules-load.d/cuttlefish-common.conf
    boot.kernelModules = [ "vhci-hcd" "vhost_net" "vhost_vsock" "i2c-dev" ];

    users.groups = {
      cvdnetwork = {};
      render = {};
      kvm = {};
    };

    # /etc/NetworkManager/conf.d/99-cuttlefish.conf
    networking.networkmanager.unmanaged = [
      "interface-name:cvd-*"
    ];

    # /lib/udev/rules.d/60-cuttlefish-base.rules
    services.udev.packages = [
      inputs.self.packages.${pkgs.system}.cuttlefish-base
    ];

    systemd.services.cuttlefish-host-resources = {
      description = "Set up initial cuttlefish environment";

      before = [ "multi-user.target" "graphical.target" ];
      after = [ "network-online.target" "remote-fs.target" ];
      wants = [ "network-online.target" ];

      serviceConfig = {
        Type = "forking";
        Restart = "no";
        TimeoutSec = "5min";
        IgnoreSIGPIPE= "no";
        KillMode = "process";
        GuessMainPID = "no";
        RemainAfterExit = "yes";
        SuccessExitStatus = "5 6";
        ExecStart = "${inputs.self.packages.${pkgs.system}.cuttlefish-base}/etc/init.d/cuttlefish-base.cuttlefish-host-resources.init start";
        ExecStop = "${inputs.self.packages.${pkgs.system}.cuttlefish-base}/etc/init.d/cuttlefish-base.cuttlefish-host-resources.init stop";
      };
    };

  users.users.${specialArgs.username}.extraGroups = [ "kvm" "cvdnetwork" "render" "dialout" ];
  users.groups.dialout = {
    gid = lib.mkForce 6969;
  };

  services.udev.extraRules = ''
    KERNEL=="ttyUSB0", OWNER="${specialArgs.username}"
  '';

  services.avahi.enable = true;

  environment.systemPackages = [ pkgs.ddcutil ];

  # ESP-IDF
#  environment.persistence."${config.modules.services.persistence.system.persistenceRoot}" = {
#    users."${specialArgs.username}" = {
#      directories = [ ".espressif" ];
#    };
#  };

  # Meta
  system.stateVersion = "23.05";
}
