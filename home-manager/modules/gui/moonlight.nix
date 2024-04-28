{
  config,
  osConfig ? { },
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.gui.moonlight;
in
{
  options.modules.gui.moonlight = {
    enable = mkEnableOption "Moonlight";
  };

  config = mkIf cfg.enable (mkMerge [ { home.packages = [ pkgs.moonlight-qt ]; } ]);
}
