#
# Home-Manager configuration for user nate
#
{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ((import ../../modules) inputs)
    inputs.hyprland.homeManagerModules.default
    inputs.minidev.homeModules.default
    inputs.nix-index-database.hmModules.nix-index
  ];

  modules = {
    services = {
      virtualization.enable = true;
      xdg.enable = true;
      wayvnc.enable = true;
    };
    gui = {
      fonts.enable = true;
      cursors.enable = true;
      kitty = {
        enable = true;
        fontSize = "14.0";
      };
      niri.enable = true;
      hyprland.enable = true;
      wayland.enable = true;
      bar.enable = true;
      rofi.enable = true;
      firefox.enable = true;
      chromium.enable = true;
      mako.enable = true;
      ags.enable = true;
    };
    dev = {
      shell.enable = true;
      android.enable = true;
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
      bat.enable = true;
    };
  };

  minidev = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages =
    [
      (pkgs.prismlauncher.override{withWaylandGLFW=true;})
      pkgs.alsa-oss # TODO: https://github.com/NixOS/nixpkgs/issues/206378
    ]
    ++ (with pkgs; [
      dconf2nix
      obsidian
      fd
    ]);

  programs.nix-index-database.comma.enable = true;

  # Meta
  home.stateVersion = "23.05";
}
