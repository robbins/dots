#
# Home-Manager configuration for user nate
#

{ config, pkgs, inputs, ... }:
{
  imports = [
    ((import ../../modules) inputs) # all my custom HM modules
    inputs.hyprland.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.minidev.homeModules.default
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
      git = {
        enable = true;
        userName = "Nathanael Robbins";
        userEmail = "nejrobbins@gmail.com";
      };
      ghcli.enable = true;
      neovim.enable = true;
    };
  };

  # Misc
  minidev = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = [
    inputs.hyprland-contrib.packages.x86_64-linux.grimblast
    inputs.comma.packages.x86_64-linux.comma
  ];


  # Meta
  home.stateVersion = "21.05";
}
