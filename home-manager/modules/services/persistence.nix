{
  config,
  pkgs,
  lib,
  inputs,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.services.persistence.home;
in {
  imports = [
    "${inputs.impermanence}/home-manager.nix"
  ];
  options.modules.services.persistence.home.enable = mkEnableOption "persistence";
  config = mkIf cfg.enable {
    home.persistence."/persist/home/${specialArgs.username}" = {
      directories = [
      ];
      files = [
      ];
      allowOther = true;
    };
  };
}
