{ config, pkgs, lib, specialArgs, ... }:

with lib;
let cfg = config.modules.user;
in {
  options.modules.user = {
    enable = mkEnableOption "enable";
  };

  config = mkIf cfg.enable {
    users = {
      mutableUsers = false;
      users = {
         ${specialArgs.username} = {
         extraGroups = [ "wheel" ];
         isNormalUser = true;
         password = "1";
         passwordFile = config.age.secrets.nate_user_password.path;
         home = "/home/${specialArgs.username}";
       };
      };
    };
  };
}
