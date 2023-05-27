{ config, pkgs, lib, specialArgs, ...}:

with lib;
let cfg = config.modules.services.lxd;
in {
  options.modules.services.lxd = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable {
    virtualisation = {
      lxd = {
        enable = true;
	zfsSupport = true;
        recommendedSysctlSettings = true;
      };
      lxc = {
        enable = true;
	lxcfs.enable = true;
	defaultConfig = "lxc.include = ${pkgs.lxcfs}/share/lxc/config/common.conf.d/00-lxcfs.conf";
      };
    };
    users.users.${specialArgs.username}.extraGroups = [ "lxd" ];
  };
}
