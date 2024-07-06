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
  cfg = config.modules.gui.ags;
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  options.modules.gui.ags.enable = mkEnableOption "Ags";

  config = mkIf cfg.enable {
    programs.ags = {
      enable = true;
      configDir = null;
    };
  };
}
