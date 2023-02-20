{ config, pkgs, lib, inputs, specialArgs, ... }:

with lib;
let cfg = config.modules.services.persistence.home;
in {
  imports = [
    "${inputs.impermanence}/home-manager.nix"
  ];
  options.modules.services.persistence.home.enable = mkEnableOption "persistence";
  config = mkIf cfg.enable {
    home.persistence."/persist/home/${specialArgs.username}" = {
      directories = [
        "Desktop"
        "Downloads"
        "Documents"
        "Pictures"
        "Music"
        "Videos"
        ".local/share/icons"
        ".icons"
        ".config/discord"
        ".minecraft"
        ".local/share/direnv/allow"
        ".ssh"
        ".local/share/TelegramDesktop"
        ".config/microsoft-edge-dev"
        ".cache/microsoft-edge-dev"
        ".cache/nix-index"
#        ".steam"

        ".config/gtk-3.0"
        ".config/gtk-4.0"
        ".config/plasma-workspace"

        ".local/share/aurorae"
        ".local/share/color-schemes"
        ".local/share/dolphin"
        ".local/share/gwenview"
        ".local/share/kactivitymanagerd"
        ".local/share/kcookiejar"
        ".local/share/klipper"
        ".local/share/knewstuff3"
        ".local/share/konsole"
        ".local/share/kscreen"
        ".local/share/kwalletd"
        ".local/share/plasma"
        ".local/share/RecentDocuments"

        ".config/kdedefaults"
        ".config/autostart"

        ".local/share/PolyMC" #TODO: /games maybe? if we can move in polymc settings
        ".themes"
        ".local/share/backgrounds"
        ".config/Google"
        ".android"

        ".cache/jdtls"
        ".cache/Google"

        ".config/JetBrains"

        ".config/goa-1.0"

        ".config/swaync"

        ".local/share/PrismLauncher"

        ".local/share/lutris"
        ".wine"

        ".config/forge"

      ];
      files = [
        ".config/gh/hosts.yml"
        ".config/monitors.xml"
      ];
      allowOther = true;
    };
  };
}
