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
  # imports = [ inputs.niri.homeModules.niri ];

  options.modules.gui.niri.enable = mkEnableOption "Niri";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ swaybg ];
    home.sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    programs.niri = {
      settings = {
      };
    };
  };
}
