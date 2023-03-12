{ config, pkgs, lib, specialArgs, ... }:

with lib;
let cfg = config.modules.gui.displayManager;
in {
  options.modules.gui.displayManager = {
    enable = mkEnableOption "enable";
    autoLogin = mkOption { default = false; type = types.bool; };
    autoSessionCommand = mkOption { default = false; type = types.str; }; # TODO: nest this under autoLogin

  };

  config = mkIf cfg.enable (mkMerge [
    {
      environment.systemPackages = [ pkgs.wlr-randr ];
    }

    (mkIf cfg.autoLogin {
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.greetd.greetd}/bin/agreety --cmd bash";
          };
          initial_session = {
            command = "${cfg.autoSessionCommand}";
            user = "${specialArgs.username}";
          };
        };
      };
    })
  ]);
}