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
    enable = mkEnableOption "Android App Development Utilities";
  };

  config = mkIf cfg.enable {
    home.packages =
      let
        # Automatically connect to ADB Wi-Fi without having to check the port number
        adb-wireless-find-port = pkgs.writeShellScriptBin "adbw" ''
          set -x
          set -e
          DEVICE=''${1-oneplus7pro}
          PORT=$(${pkgs.nmap}/bin/nmap $DEVICE -p 37000-44000 | ${pkgs.gawk}/bin/awk "/\/tcp/" | ${pkgs.coreutils}/bin/cut -d/ -f1)
          ${pkgs.android-tools}/bin/adb connect $DEVICE:$PORT
        '';
      in
      [
        pkgs.scrcpy # Screen mirroring
        pkgs.httpie # HTTP requests
        adb-wireless-find-port
      ];
    home.sessionVariables = {
      ANDROID_USER_HOME = "${config.xdg.configHome}/android";
    };
  };
}
