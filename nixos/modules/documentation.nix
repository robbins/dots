{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.documentation;
in
{
  options.modules.documentation = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable {
    documentation = {
      enable = true;
      info.enable = true;
      doc.enable = true;
      dev.enable = true;
      man = {
        enable = true;
        generateCaches = false;
      };
    };
    environment.systemPackages = with pkgs; [
      man-pages
      man-pages-posix
      linux-manual
    ];
  };
}
