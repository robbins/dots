#
# Home-Manager configuration for user nate
#

{ config, pkgs, inputs, ... }:
{
  imports = [
    ((import ../../modules) inputs) # all my custom HM modules
    inputs.hyprland.homeManagerModules.default
  ];
  modules = {
    services = {
      persistence.home.enable = true;
    };
    gui = {
      microsoftEdge.enable = true;
      kitty.enable = true;
      hyprland.enable = true;
      wayland.enable = true;
    };
    dev = {
      shell.enable = true;
    };
    shell = {
      zsh.enable = true;
    };
  };

  # Meta
  home.stateVersion = "21.05";
}
