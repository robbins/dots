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
    ((import ../../modules) inputs) # all my custom HM modules TODO cant pull up to common iirc for some reason maybe its good cause itll evaluate on all hosts which might not be compatible
    inputs.nixvim.homeManagerModules.nixvim
    inputs.minidev.homeModules.default
    inputs.nix-index-database.hmModules.nix-index
  ];
  modules = {
    services = {
      xdg.enable = true;
    };
    gui = {
      kitty.enable = true;
      wayland.enable = true;
    };
    dev = {
      shell.enable = true;
    };
    shell = {
      zsh.enable = true;
      ripgrep.enable = true;
      git = {
        enable = true;
        userName = "Nathanael Robbins";
        userEmail = "nejrobbins@gmail.com";
      };
      ghcli.enable = true;
      neovim.enable = true;
      direnv.enable = true;
      dircolors.enable = true;
    };
  };

  # Misc
  minidev = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    obsidian
  ];

  programs.nix-index-database.comma.enable = true;

  # Meta
  home.stateVersion = "23.05";
}
