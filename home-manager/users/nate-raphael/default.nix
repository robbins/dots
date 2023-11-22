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
    services = {
      xdg.enable = true;
    };
    gui = {
      hyprland.enable = true;
      kitty.enable = true;
      microsoftEdge.enable = true;
      bar.enable = true;
      rofi.enable = true;
    };
    dev = {
      shell.enable = true;
      android.enable = true;
    };
    shell = {
      neovim.enable = true;
      zsh.enable = true;
      ripgrep.enable = true;
      git = {
        enable = true;
	userName = "Nathanael Robbins";
	userEmail = "nejrobbins@gmail.com";
      };
      ghcli.enable = true;
      direnv.enable = true;
      dircolors.enable = true;
    };
  };

  minidev = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.nix-index-database.comma.enable = true;

  # Meta
  home.stateVersion = "23.05";
}
