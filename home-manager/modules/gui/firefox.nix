{
  config,
  osConfig ? { },
  pkgs,
  lib,
  inputs,
  specialArgs,
  ...
}:
with lib;
let
  cfg = config.modules.gui.firefox;
in
{
  options.modules.gui.firefox = {
    enable = mkEnableOption "Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin;
      profiles.default = {
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          darkreader
          ublock-origin
          sponsorblock
          surfingkeys
        ];
      };
    };
  };
}
