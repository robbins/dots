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

  config = let
    homeCfg = config.home-manager.users.${specialArgs.username} or { };
  in lib.mkIf cfg.enable {
    security.sudo.extraConfig = ''
      Defaults lecture = never
    '';

    environment.persistence."${cfg.persistenceRoot}" = {
      hideMounts = true;
      files = [
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
        ]
        ++ (if cfg.persistUserSshKeys then [".ssh"] else [])
        ++ (if (homeCfg.modules.gui.microsoftEdge.enable or false) then [ ".config/microsoft-edge-dev" ".cache/microsoft-edge-dev" ] else [])
        ++ (if specialArgs.isDesktop then [ ".icons" ".themes" ".local/share/icons" "downloads" "music" "pictures" "videos" ] else [])
        ++ (if (homeCfg.modules.dev.android.enable or false) then [ ".local/share/android/sdk" ".config/android" ".config/Google" ".cache/Google" ] else []) # TODO: if system adb module as well? maybe if androidFeature where androidFeature is a global of home.android or system.android?
        ++ (if (homeCfg.modules.gui.firefox.enable or false) then [ ".mozilla" ] else [])
        ++ (if (homeCfg.modules.gui.chromium.enable or false) then [ ".cache/chromium" ] else []);
        # ALSO todo use xdg dir vars here? or did we have an issue doing that
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
        files = [
          ".config/gh/hosts.yml" # TODO: figure out if we can instead set this in the home-manager gh module
        ];
      };
    };
  };
}
