{ config, pkgs, lib, ...}:

with lib;
let cfg = config.modules.services.xdg;
in {
  options.modules.services.xdg = {
    enable = lib.mkEnableOption "XDG";
  };

  config = {
    xdg = {
      enable = true;
      cacheHome = "${config.home.homeDirectory}/.cache";
      configHome = "${config.home.homeDirectory}/.config";
      dataHome = "${config.home.homeDirectory}/.local/share";
      stateHome = "${config.home.homeDirectory}/.local/state";
      userDirs = {
        enable = true;
        desktop = null;
        documents = null;
        download = "${config.home.homeDirectory}/downloads";
        music = "${config.home.homeDirectory}/music";
        pictures = "${config.home.homeDirectory}/pictures";
        publicShare = null;
        templates = null;
        videos = "${config.home.homeDirectory}/videos";
      };
   };
 };
}
