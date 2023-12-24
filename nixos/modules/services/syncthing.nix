{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.services.syncthing;
in {
  options.modules.services.syncthing = {
    enable = mkOption {default = false;};
  };
  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      user = specialArgs.username;
      overrideDevices = true;     # overrides any devices added or deleted through the WebUI
      overrideFolders = true;     # overrides any folders added or deleted through the WebUI
      dataDir = if (config.modules.services.persistence.system.enable or false == true) then "/persist/home/${specialArgs.username}/.config/syncthing/db" else "/home/${specialArgs.username}/.config/syncthing/db";
      configDir = if (config.modules.services.persistence.system.enable or false == true) then "/persist/home/${specialArgs.username}/.config/syncthing" else "/home/${specialArgs.username}/.config/syncthing";
      settings = {
        devices = {
          "oneplus-7-pro" = { id = "BVEUPVT-D4XSNJU-JMRAJ6Q-MEX4X3H-ACB7D4K-AH2NCK7-2AN3LNF-V6J3QQR"; };
        };
        folders = {
          "Nate's Vault" = {
            path = "/home/${specialArgs.username}/data/obsidian/nates-vault";
            devices = [ "oneplus-7-pro" ];
          };
        };
      };
    };
  };
}
