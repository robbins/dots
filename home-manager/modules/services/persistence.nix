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
        ".local/share/icons"
        ".config/discord"
        ".local/share/direnv/allow"
        ".local/share/TelegramDesktop"
        ".config/microsoft-edge-dev"
        ".cache/microsoft-edge-dev"

        ".config/gtk-3.0"
        ".config/gtk-4.0"

        ".local/share/backgrounds"
        ".config/Google"

        ".cache/jdtls"
        ".cache/Google"

        ".config/JetBrains"

        ".local/share/PrismLauncher"

	".local/state/nix/profiles"

	".config/BraveSoftware"

	".config/paperwm"

      ];
      files = [
      ];
      allowOther = true;
    };
  };
}
