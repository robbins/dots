{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.gui.fonts;
in
{
  options.modules.gui.fonts = {
    enable = mkEnableOption "Fonts";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      fonts.fontconfig.defaultFonts.monospace = [ "PragmataPro Mono Liga Regular" ];
      fonts.fontconfig.defaultFonts.sansSerif = [ "SF Pro Text" ];
      environment.sessionVariables = {
        FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
      };
    }
  ]);
}
