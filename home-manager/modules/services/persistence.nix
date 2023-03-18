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
        "downloads"
        "pictures"
        "music"
        "videos"
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

        ".config/gtk-3.0"
        ".config/gtk-4.0"

        ".local/share/backgrounds"
        ".config/Google"
        ".android"

        ".cache/jdtls"
        ".cache/Google"

        ".config/JetBrains"

        ".local/share/PrismLauncher"

	".local/state/nix"
      ];
      files = [
        ".config/gh/hosts.yml"
      ];
      allowOther = true;
    };
  };
}
