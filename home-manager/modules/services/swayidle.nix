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
  cfg = config.modules.services.swayidle;
in
{
  options.modules.services.swayidle = {
    enable = mkEnableOption "Swayidle";
  };

  config =
    let
      lock = "${config.programs.swaylock.package}/bin/swaylock -fF";
      suspend = "${pkgs.coreutils}/bin/sleep 1 && ${pkgs.systemd}/bin/systemctl suspend";
      isOnBattery = pkgs.writeShellScript "is-on-battery" ''
        [ "$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/AC0/online)" = "0" ] || exit 1
      '';
      dpms-off = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
      dim-screen = "echo 100 > /sys/class/backlight/amdgpu_bl0/brightness";
      undim-screen = "echo 255 > /sys/class/backlight/amdgpu_bl0/brightness";
    in
    mkIf cfg.enable {
      services.swayidle = {
        enable = true;
        events = [
          {
            event = "before-sleep";
            command = lock;
          }
          {
            event = "after-resume";
            command = "${pkgs.asusctl}/bin/asusctl profile -P Quiet";
          }
          {
            event = "lock";
            command = lock;
          }
        ];
        timeouts = [
          # TODO: some are only valid on a laptop
          {
            timeout = 120;
            command = "${isOnBattery} && ${dim-screen}";
            resumeCommand = "${isOnBattery} && ${undim-screen}";
          } # If on battery dim screen after 2 minutes
          {
            timeout = 300;
            command = lock;
          } # Lock screen after 5 minutes
          {
            timeout = 360;
            command = dpms-off;
          } # Turn off display after 6 minutes
          {
            timeout = 600;
            command = "${isOnBattery} && ${suspend}";
          } # If on battery suspend after 10 minutes
        ];
      };
    };
}
