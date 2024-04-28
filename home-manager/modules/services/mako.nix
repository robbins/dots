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
  cfg = config.modules.gui.mako;
in
{
  options.modules.gui.mako = {
    enable = mkEnableOption "Mako";
  };

  config = mkIf cfg.enable {
    services.mako = {
      enable = true;
      font = "PragmataPro Mono Liga Regular 12";
      defaultTimeout = 8000; # Timeout in ms
    };
  };
}
