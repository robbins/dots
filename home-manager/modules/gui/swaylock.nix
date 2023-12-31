{
  config,
  osConfig ? {},
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.gui.swaylock;
in {
  options.modules.gui.swaylock = {
    enable = mkEnableOption "Swaylock";
  };

  config = mkIf cfg.enable {
    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        image = "/home/${specialArgs.username}/pictures/wallpapers/apple-macbook-pro-stock-2021-apple-event-2021-dark-mode-6016x5468-6759.jpg";
        scaling = "fill";
        clock = true;
        timestr = "%I:%M:%S %p";
        datestr = "%F";
        indicator = true;
        indicator-radius = 120;
        indicator-thickness = 12;
        text-color = "EBDBB2";
        text-clear-color = "EBDBB2";
        text-caps-lock-color = "EBDBB2";
        text-ver-color = "EBDBB2";
        text-wrong-color = "EBDBB2";
        inside-color = "00000055";
        line-color = "282828";
        ring-color = "EBDBB2";
        separator-color = "EBDBB2";
        bs-hl-color = "FB4934";
        key-hl-color = "B8BB26";
        line-clear-color = "FABD2F";
        inside-clear-color = "00000066";
        ring-clear-color = "FABD2F";
        ring-ver-color = "458588";
        inside-ver-color = "00000066";
        ring-wrong-color = "FB4934";
        inside-wrong-color = "00000066";
        font-size = 30;
      };
    };
  };
}
