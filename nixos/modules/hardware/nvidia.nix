{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.hardware.nvidia;
in
{
  options.modules.hardware.nvidia = {
    enable = mkEnableOption "Nvidia";
  };

  config = mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      open = true;
      dynamicBoost.enable = false;
      powerManagement.finegrained = true;
      nvidiaPersistenced = false;
    };
  };
}
