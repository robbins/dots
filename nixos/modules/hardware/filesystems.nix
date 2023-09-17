{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.hardware.filesystems;
in {
  options.modules.hardware.filesystems = {
    enable = mkEnableOption "filesystems";
    zfs = {
      enable = mkEnableOption "zfs";
      unstable = mkOption {
        default = false;
        type = types.bool;
      };
      hostId = mkOption {
        default = "";
        type = types.str;
      };
    };
  };
  config = mkIf cfg.enable (mkMerge [
    {
      environment.systemPackages = with pkgs; [
        e2fsprogs
      ];
      boot.supportedFilesystems = ["ntfs"];
    }

    (mkIf cfg.zfs.enable {
      boot = {
        supportedFilesystems = ["zfs"];
        zfs = {
          enableUnstable = cfg.zfs.unstable;
          devNodes = "/dev/disk/by-partuuid";
        };
        kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
      };
      networking.hostId = cfg.zfs.hostId;
      services.zfs = {
        autoScrub = {
          enable = true;
          pools = ["${config.networking.hostName}"];
          interval = "monthly";
        };
        trim.enable = true;
      };
      services.fstrim.enable = mkForce false;
    })
  ]);
}
