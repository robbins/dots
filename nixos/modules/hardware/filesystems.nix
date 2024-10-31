{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.hardware.filesystems;
in
{
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
      environment.systemPackages = with pkgs; [ e2fsprogs ];
      boot.supportedFilesystems = [ "ntfs" ];
    }

    (mkIf cfg.zfs.enable {
      boot = {
        supportedFilesystems = [ "zfs" ];
        zfs = {
          package = if cfg.zfs.unstable then pkgs.zfsUnstable else pkgs.zfs;
          devNodes = "/dev/disk/by-partuuid";
        };
        kernelPackages = let
          isUnstable = config.boot.zfs.package == pkgs.zfsUnstable;
          zfsCompatibleKernelPackages = lib.filterAttrs (name: kernelPackages:
            (builtins.match "linux_[0-9]+_[0-9]+" name) != null
            && (builtins.tryEval kernelPackages).success
            && ((!isUnstable && !kernelPackages.zfs.meta.broken)
              || (isUnstable && !kernelPackages.zfs_unstable.meta.broken)
            )) pkgs.linuxKernel.packages;
          latestKernelPackage = lib.last 
            (lib.sort 
              (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (builtins.attrValues zfsCompatibleKernelPackages));
        in latestKernelPackage;
      };
      networking.hostId = cfg.zfs.hostId;
      services.zfs = {
        autoScrub = {
          enable = true;
          interval = "monthly";
        };
        trim.enable = true;
      };
      services.fstrim.enable = mkForce false;
    })
  ]);
}
