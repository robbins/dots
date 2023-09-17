{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.documentation;
in {
  options.modules.documentation = {
    enable = mkOption {default = false;};
  };
  config = mkIf cfg.enable {
    documentation = {
      dev.enable = true;
      man.generateCaches = true;
    };
  };
}
