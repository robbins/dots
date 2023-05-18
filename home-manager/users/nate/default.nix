#
# Home-Manager configuration for user nate
#

{ config, pkgs, inputs, ... }:
{
  imports = [
    ((import ../../modules) inputs) # all my custom HM modules
    ./dconf.nix
    inputs.hyprland.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.minidev.homeModules.default
  ];
  modules = {
    services = {
      persistence.home.enable = true;
      xdg.enable = true;
    };
    gui = {
      kitty.enable = true;
      hyprland.enable = false;
      wayland.enable = true;
      bar.enable = true;
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
      direnv.enable = true;
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
  ] ++ (with pkgs; [
    bemenu #TODO: wayland launcher module
    j4-dmenu-desktop # same
    zathura # TODO module
    brave
    dconf2nix
  ]);

  # Meta
  home.stateVersion = "21.05";
}
