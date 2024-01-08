{ lib, ... }:
{
  disk = lib.genAttrs [ "S3YHNX0K836387Z" ]
    (disk: {
      type = "disk";
      device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_250GB_${disk}";
      content = {
        type = "gpt";
	partitions = {
	  ESP = {
            size = "1G";
	    type = "EF00";
	    content = {
	      type = "filesystem";
	      format = "vfat";
	      mountpoint = "/boot";
	    };
	  };
	  SWAP = {
            size = "16G";
            type = "8200";
	    content = {
	      type = "swap";
	      randomEncryption = true;
	      resumeDevice = true;
	    };
	  };
	  ZFS = {
	    size = "100%";
	    content = {
	      type = "zfs";
	      pool = "bulldozer";
	    };
	  };
	};
      };
    });
  zpool = {
    bulldozer = {
      type = "zpool";
      options = {
        ashift = "12";
	autotrim = "on";
      };
      rootFsOptions = {
        atime = "off";
	compression = "lz4";
	xattr = "sa";
	mountpoint = "none";
        canmount = "off";
	acltype = "posixacl";
	encryption = "aes-256-gcm";
	keyformat = "passphrase";
	keylocation = "prompt";
	normalization = "formD";
	"com.sun:auto-snapshot" = "false";
      };
      datasets = {
	system.type = "zfs_fs";
	"system/var/log" = {
	  type = "zfs_fs";
          mountpoint = "/var/log";
	  options.mountpoint = "legacy";
	};
        local.type = "zfs_fs";
	"local/nix" = {
	  type = "zfs_fs";
          mountpoint = "/nix";
	  options.mountpoint = "legacy";
	};
	"persist" = {
	  type = "zfs_fs";
          mountpoint = "/persist";
	  options.mountpoint = "legacy";
	};
      };
    };
  };
}
