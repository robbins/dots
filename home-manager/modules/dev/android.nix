{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.dev.android;
in {
  options.modules.dev.android = {
    enable = lib.mkEnableOption "Android Development";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      scrcpy
    ];
  };
}
