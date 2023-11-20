{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.hardware.bootloader;
in {
  options.modules.hardware.bootloader = {
    quiet = lib.mkOption {
      default = false;
      type = types.bool;
    };
    sshInitrd = lib.mkOption {
      default = false;
      type = types.bool;
    };
  };

  config = mkMerge [
    (mkIf cfg.quiet {
      boot = {
        consoleLogLevel = 0;
        initrd = {
          verbose = false;
          systemd.enable = true;
        };
        plymouth.enable = true;
        kernelParams = ["quiet" "splash" "rd.systemd.show_status=false" "udev.log_level=3" "udev.log_priority=3" "boot.shell_on_fail"];
      };
    })

    (mkIf cfg.sshInitrd {
      boot = {
        kernelParams = [ "ip=192.168.2.214::::::" ];
        initrd.kernelModules = [ "ath9k" ];
        initrd.network = {
	  enable = true;
	  ssh = {
	    enable = true;
	    port = 2222;
	    hostKeys = [ /boot/initrd-ssh-key ];
	    authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB/86wvKSCteBIkuI/Jjtvtv7flTvWD6EVBBJkhqddPP" ];
	  };
	};
      };
    })

  ];
}
