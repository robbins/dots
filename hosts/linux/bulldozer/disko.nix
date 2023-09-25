{ lib, ... }:
{
  disko.devices.disk = lib.genAttrs [ "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_250GB_S3YHNX0K836387Z" ]
    (disk: {
      type = "disk";
      device = disk;
      content = {
        type = "gpt";
	partitions = {
	  ESP = {
	    start = "0";
	    end = "1024MiB";
	    type = "EF00";
	    content = {
	      type = "filesystem";
	      format = "vfat";
	      mountpoint = "/boot";
	    };
	  };
	  SWAP = {
	    start = "1024MiB";
	    end = "9216MiB";
	    content = {
	      type = "swap";
	      randomEncryption = true;
	      resumeDevice = true;
	    };
	  };
	  ZFS = {
	    start = "9216MiB";
	    end = "100%";
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
        zfs snapshot -r bulldozer@blank
	zfs set keylocation="prompt" "bulldozer";
	'';
      datasets = {
        local.type = "zfs_fs";
	"local/nix" = {
	  type = "zfs_fs";
	  options.mountpoint = "/nix";
	};
	"persist" = {
	  type = "zfs_fs";
	  options.mountpoint = "/persist";
	};
	system.type = "zfs_fs";
	"system/root" = {
	  type = "zfs_fs";
	  mountpoint = "/";
	};
      };
    };
  };
}
