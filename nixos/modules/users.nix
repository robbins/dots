{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.user;
in {
  options.modules.user = {
    enable = mkEnableOption "enable";
    hashedPwFile = mkOption {
      default = "";
#      type = types.path;
    };
  };

  config = mkIf cfg.enable {
    users = {
      mutableUsers = false;
      users = {
        ${specialArgs.username} = {
          extraGroups = ["wheel"];
          isNormalUser = true;
          password = "1";
          home = "/home/${specialArgs.username}";
        } // (if (cfg.hashedPwFile != "") then {hashedPasswordFile = cfg.hashedPwFile.path;} else {});
      };
    };
    nix.settings.trusted-users = ["${specialArgs.username}"];
  };
}
