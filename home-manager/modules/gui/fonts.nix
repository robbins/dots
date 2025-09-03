{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.gui.fonts;
in
{
  options.modules.gui.fonts = {
    enable = mkEnableOption "Font Configuration";
  };

  config = mkIf cfg.enable {
    home.packages = [
      #inputs.self.packages.${pkgs.system}.apple-fonts
      inputs.self.packages.${pkgs.system}.pragmata-pro-mono-liga
      inputs.self.packages.${pkgs.system}.nerd-fonts-symbols-only
      pkgs.material-symbols
    ];
  };
}
