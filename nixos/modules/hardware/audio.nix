{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.hardware.audio;
in {
  options.modules.hardware.audio = {
    enable = mkEnableOption "enable";
    bluetooth.enable = mkOption { default = false; type = lib.types.bool; };
  };

  config = mkIf cfg.enable {
    hardware.pulseaudio.enable = false;
    sound.enable = mkForce false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
       alsa = {
         enable = true;
         support32Bit = true;
       };
       pulse.enable = true; #TODO: check if we need Pulseaudio backend
     };
    hardware.bluetooth.enable = cfg.bluetooth.enable;
  };
}

