#
# Home-Manager configuration for user nate
#
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ((import ../../modules) inputs)
    inputs.hyprland.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.minidev.homeModules.default
    inputs.nix-index-database.hmModules.nix-index
  ];

  modules = {
    gui = {
      hyprland.enable = true;
      kitty.enable = true;
      microsoftEdge.enable = true;
      bar.enable = true;
    };
    shell = {
      neovim.enable = true;
      zsh.enable = true;
      git = {
        enable = true;
	userName = "Nathanael Robbins";
	userEmail = "nejrobbins@gmail.com";
      };
      ghcli.enable = true;
    };
  };

  programs.nix-index-database.comma.enable = true;

  # Meta
  home.stateVersion = "21.05";
}
