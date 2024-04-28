{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.hardware.laptop;
in
{
  options.modules.hardware.laptop.enable = mkEnableOption "Laptop";

  config = mkIf cfg.enable { services.power-profiles-daemon.enable = true; };
}
