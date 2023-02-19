{ config, pkgs, lib, ...}:

with lib;
let cfg = config.modules.services.ssh;
in {
  options.modules.services.ssh = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable {
    services.openssh.enable = true;
  };
}
