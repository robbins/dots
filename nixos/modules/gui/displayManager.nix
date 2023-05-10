{ config, pkgs, lib, specialArgs, ... }:

with lib;
let cfg = config.modules.gui.displayManager;
in {
  options.modules.gui.displayManager = {
    enable = mkEnableOption "enable";
    autoLogin = mkOption { default = false; type = types.bool; };
    autoSessionCommand = mkOption { default = false; type = types.str; }; # TODO: nest this under autoLogin
    gnome = mkOption { default = false; type = types.bool; };
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
            command = "${pkgs.greetd.greetd}/bin/agreety --cmd zsh";
          };
          initial_session = {
            command = "${cfg.autoSessionCommand}";
            user = "${specialArgs.username}";
          };
        };
      };
    })

    (mkIf cfg.gnome {
      services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
	desktopManager.gnome.enable = true;
      };
      networking.networkmanager.enable = lib.mkForce false;
      environment.gnome.excludePackages = (with pkgs; [
        gnome-photos
        gnome-tour
      ]) ++ (with pkgs.gnome; [
        cheese # webcam tool
        gnome-music
        gnome-terminal
        epiphany # web browser
        geary # email reader
        evince # document viewer
        gnome-characters
        totem # video player
      ]);
      environment.systemPackages = with pkgs.gnome; [
        gnome-tweaks
      ] ++ (with pkgs.gnomeExtensions; [
        just-perfection
	blur-my-shell
      ]);
    })
  ]);
}
