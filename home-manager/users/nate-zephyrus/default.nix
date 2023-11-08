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
    ./dconf.nix
    inputs.hyprland.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.minidev.homeModules.default
    inputs.nix-index-database.hmModules.nix-index
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
      bar.enable = false;
      rofi.enable = false;
      microsoftEdge.enable = true;
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

  home.packages =
    [
    ]
    ++ (with pkgs; [
      brave
      dconf2nix
    ]);

  programs.nix-index-database.comma.enable = true;

  # Meta
  home.stateVersion = "21.05";
}