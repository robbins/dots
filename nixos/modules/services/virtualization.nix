{ config, pkgs, lib, specialArgs, ...}:

with lib;
let cfg = config.modules.services.virtualization;
in {
  options.modules.services.virtualization = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ virt-manager ];
    users.users.${specialArgs.username}.extraGroups = [ "libvirtd" ];
  };
}
