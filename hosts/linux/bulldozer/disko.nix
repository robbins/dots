{ lib, ... }:
{
  disko.devices.disk = lib.genAttrs [ "S3YHNX0K836387Z" ]
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
            size = "8G";
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
  disko.devices.zpool = {
    bulldozer = {
      type = "zpool";
      options = {
        ashift = "13";
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
      postCreateHook = ''
        zfs snapshot -r bulldozer/system/root@blank
	zfs set keylocation="prompt" "bulldozer";
	'';
      datasets = {
	system.type = "zfs_fs";
	"system/root" = {
	  type = "zfs_fs";
          mountpoint = "/";
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
