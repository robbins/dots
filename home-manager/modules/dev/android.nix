{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.dev.android;
in
{
  options.modules.dev.android = {
    enable = mkEnableOption "Android Development";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ scrcpy ];
    home.sessionVariables = {
      ANDROID_USER_HOME = "${config.xdg.configHome}/android";
    };
  };
}
