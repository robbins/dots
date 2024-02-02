{
  config,
  osConfig ? {},
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.services.sunshine;
in {
  options.modules.services.sunshine = {
    enable = mkEnableOption "Sunshine";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.sunshine ];
  };
}
