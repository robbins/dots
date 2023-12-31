{
  config,
  osConfig ? {},
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.gui.firefox;
in {
  options.modules.gui.firefox = {
    enable = mkEnableOption "Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-devedition.override {
        nativeMessagingHosts = [
          pkgs.tridactyl-native
        ];
      };
    };
  };
}
