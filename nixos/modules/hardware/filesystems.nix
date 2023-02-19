{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.hardware.filesystems;
in {
  options.modules.hardware.filesystems = {
    enable = mkEnableOption "filesystems";
    zfs = {
      enable = mkEnableOption "zfs";
      unstable = mkOption { default = false; type = types.bool; };
      hostId = mkOption { default = ""; type = types.str; };
    };
  };
  config = mkIf cfg.enable (mkMerge [
    {
    }

    (mkIf cfg.zfs.enable {
      boot = {
        supportedFilesystems = [ "zfs" ];
        zfs.enableUnstable = cfg.zfs.unstable;
        kernelPackages = pkgs.zfs.latestCompatibleLinuxPackages;
      };
      networking.hostId = cfg.zfs.hostId;
    })
  ]);
}
