{ config, pkgs, lib, ... }:

let cfg = config.modules.hardware.audio;
in {
  options.modules.hardware.audio = {
    enable = lib.mkEnableOption "enable";
    bluetooth.enable = lib.mkOption { default = false; type = lib.types.bool; };
  };

  config = lib.mkIf cfg.enable {
   sound.enable = mkFalse;
   security.rtkit.enable = true;
   services.pipewire = {
     enable = true;
     pulse.enable = true; #TODO: check if we need Pulseaudio backend
   };
  };
}

