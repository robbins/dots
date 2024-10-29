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
    ((import ../../modules) inputs) # all my custom HM modules TODO cant pull up to common iirc for some reason maybe its good cause itll evaluate on all hosts which might not be compatible
    ./dconf.nix
    inputs.hyprland.homeManagerModules.default
    inputs.minidev.homeModules.default
    inputs.nix-index-database.hmModules.nix-index
  ];
  modules = {
    services = {
      persistence.home.enable = true;
      xdg.enable = true;
      swayidle.enable = true;
    };
    gui = {
      fonts.enable = true;
      cursors.enable = true;
      kitty = {
        enable = true;
        fontSize = "13.0";
      };
      wezterm.enable = true;
      hyprland.enable = false;
      niri.enable = true;
      wayland.enable = true;
      bar = {
        enable = true;
        barHeight = 23;
        fontSize = "13px";
        workspaceMargin = "0px";
        windowHorizontalPadding = "12px";
        modulePadding = "8px";
        leftEdgePadding = "10px";
        rightEdgePadding = "10px";
        extraConfig = ''
          #network.wired {
            font-size: 19px;
          }
          #network.wireless {
            font-size: 14px;
          }
        '';
      };
      ags.enable = false;
      rofi.enable = true;
      firefox.enable = true;
      chromium.enable = true;
      lockscreen.enable = true;
      mako.enable = true;
      moonlight.enable = true;
    };
    dev = {
      android.enable = true;
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
      pkgs.prismlauncher
    ]
    ++ (with pkgs; [
      dconf2nix
      obsidian
      fd
    ]);

  programs.nix-index-database.comma.enable = true;

  # Meta
  home.stateVersion = "21.05";
}
