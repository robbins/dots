{
  config,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.user;
in
{
  options.modules.user = {
    enable = mkEnableOption "enable";
    hashedPasswordFile = mkOption {
      default = null;
      type = types.nullOr types.str;
    };
    password = mkOption {
      default = null;
      type = types.nullOr types.str;
    };
  };

  config = mkIf cfg.enable {
    users = {
      mutableUsers = false;
      users = {
        ${specialArgs.username} =
          {
            extraGroups = [ "wheel" ];
            isNormalUser = true;
            home = "/home/${specialArgs.username}";
          }
          // (
            if (cfg.hashedPasswordFile != null) then
              { inherit (cfg) hashedPasswordFile; }
            else if (cfg.password != null) then
              { inherit (cfg) password; }
            else
              { }
          );
      };
    };
  };
}
