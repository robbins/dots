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

    environment.persistence."${cfg.persistenceRoot}" = { # use persistentStoragePath TODO
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
        directories = []
				++ (if cfg.persistUserSshKeys then [".ssh"] else []); # TODO mkmerge or this
#	  ".ssh"
#          "downloads"
#          "pictures"
#          "music"
#          "videos"

#          ".config/discord"
#          ".config/microsoft-edge-dev"
#          ".config/gtk-3.0"
#          ".config/gtk-4.0"
#          ".config/Google"
#          ".config/JetBrains"
#          ".config/BraveSoftware"
#          ".config/paperwm"

#          ".local/share/icons"
#          ".local/share/direnv/allow"
#          ".local/share/TelegramDesktop"
#          ".local/share/backgrounds"
#          ".local/share/PrismLauncher"
#          ".local/state/nix/profiles"

#          ".cache/microsoft-edge-dev"
#          ".cache/jdtls"
#          ".cache/Google"

#          ".icons"
#          ".minecraft"
#          ".ssh"
#          ".android"
#          ".gradle"
#          ".themes"
        files = [];
      };
    };
  };
}
