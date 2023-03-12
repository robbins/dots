{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.hardware.bootloader;
in {
  options.modules.hardware.bootloader = {
    quiet = lib.mkEnableOption "Quiet boot";
  };

  config = mkIf cfg.quiet {
    boot = {
      consoleLogLevel = 0;
      initrd = {
        verbose = false;
        systemd.enable = true;
      };
      plymouth.enable = true;
      kernelParams = [ "quiet" "splash" "rd.systemd.show_status=false" "udev.log_level=3" "udev.log_priority=3" "boot.shell_on_fail" ];
    };
  };
}
