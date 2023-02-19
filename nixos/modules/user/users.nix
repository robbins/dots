{ config, pkgs, lib, specialArgs, ... }:

with lib;
let cfg = config.modules.user;
in {
  options.modules.user = {
    enable = mkEnableOption "enable";
  };

  config = mkIf cfg.enable {
    users.users.${specialArgs.username} = {
      isNormalUser = true;
      password = "1";
    };
  };
}
