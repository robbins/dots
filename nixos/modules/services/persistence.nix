{
  config,
  pkgs,
  lib,
  inputs,
  specialArgs,
  ...
}: with lib;
let
  cfg = config.modules.services.persistence.system;
in {
  imports = [
    "${inputs.impermanence}/nixos.nix"
  ];

  options.modules.services.persistence.system = {
    enable = mkEnableOption "System Persistence";
    persistenceRoot = mkOption {
			default = "/persist";
			type = types.str;
    };
		persistUserSshKeys = mkOption {
		  default = false;
			type = types.bool;
		};
  };

  config = lib.mkIf cfg.enable {
    security.sudo.extraConfig = ''
      Defaults lecture = never
    '';

    environment.persistence."${cfg.persistenceRoot}" = {
      hideMounts = true;
      files =
        [
          {
            file = "/etc/machine-id";
            parentDirectory = {
              user = "root";
              group = "root";
            };
          }
        ];
      users."${specialArgs.username}" = {
        directories = [
					".local/state/nix/profiles"
					".icons" # TODO some kind of isServer or isDesktop specialArgs?
					".themes"
          ".local/share/icons"
				]
				++ (if cfg.persistUserSshKeys then [".ssh"] else [])
				++ (if (config.home-manager.users.${specialArgs.username}.modules.gui.microsoftEdge.enable or false) then [ ".config/microsoft-edge-dev" ".cache/microsoft-edge-dev" ] else [])
				++ (if (config.home-manager.users.${specialArgs.username}.xdg.userDirs or false) then (builtins.attrValues (attrsets.filterAttrs (_: value: builtins.isString value) config.home-manager.users.${specialArgs.username}.xdg.userDirs)) else []);
#          ".config/discord"
#          ".config/gtk-3.0"
#          ".config/gtk-4.0"
#          ".config/Google"
#          ".config/JetBrains"
#          ".config/BraveSoftware"
#          ".config/paperwm"

#          ".local/share/direnv/allow"
#          ".local/share/TelegramDesktop"
#          ".local/share/backgrounds"
#          ".local/share/PrismLauncher"

#          ".cache/jdtls"
#          ".cache/Google"

#          ".minecraft"
#          ".android"
#          ".gradle"
        files = [];
      };
    };
  };
}
