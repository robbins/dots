{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.hardware.nvidia;
in {
  options.modules.hardware.nvidia = {
    enable = mkEnableOption "Nvidia";
  };

  config = mkIf cfg.enable {
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    hardware.nvidia = {
      dynamicBoost.enable = false;
      powerManagement.finegrained = true;
      nvidiaPersistenced = false;
    };
  };
}
