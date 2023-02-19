{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.android.adb;
in {
  options.modules.android.adb = {
    enable = mkEnableOption "enable";
  };

  config = mkIf cfg.enable {
    programs.adb.enable = true;
    users.users.${specialArgs.username}.extraGroups = [ "adbusers" ];
  };
}
