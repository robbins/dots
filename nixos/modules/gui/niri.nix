{
  config,
  pkgs,
  lib,
  specialArgs,
  inputs,
  ...
}:
with lib;
let
  cfg = config.modules.gui.niri;
in
{
  imports = [ inputs.niri.nixosModules.niri ];

  options.modules.gui.niri = {
    enable = mkEnableOption "Niri";
  };

  config = mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
  };
}
