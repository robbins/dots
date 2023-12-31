{
  config,
  osConfig ? {},
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.services.swayidle;
in {
  options.modules.services.swayidle = {
    enable = mkEnableOption "Swayidle";
  };

  config = mkIf cfg.enable {
    services.swayidle = {
      enable = true;
      events = [
        { event = "before-sleep"; command = "${config.programs.swaylock.package}/bin/swaylock -fF"; }
        { event = "after-resume"; command = "${pkgs.asusctl}/bin/asusctl profile -P Quiet"; }
        { event = "lock"; command = "lock"; }
      ];
      timeouts = [
        { timeout = 300; command = "${config.programs.swaylock.package}/bin/swaylock -fF"; }
        { timeout = 600; command = "${pkgs.systemd}/bin/systemctl suspend"; }
      ];
    };
  };
}
