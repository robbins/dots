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
  cfg = config.modules.gui.chromium;
in
{
  options.modules.gui.chromium = {
    enable = mkEnableOption "Chromium";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      programs.chromium = {
        enable = true;
        commandLineArgs = [
          "--enable-features=TouchpadOverscrollHistoryNavigation"
          "--user-data-dir=\"${osConfig.modules.services.persistence.system.persistenceRoot}/home/${specialArgs.username}/.config/chromium\""
        ];
        package = pkgs.chromium.override { enableWideVine = true; };
      };
      programs.zsh.shellAliases = {
        chromium = "chromium --user-data-dir=${osConfig.modules.services.persistence.system.persistenceRoot}/home/${specialArgs.username}/.config/chromium";
      };
    }
  ]);
}
