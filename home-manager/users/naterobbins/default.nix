{ config, pkgs, inputs, ... }:
{
  imports = [
    (import ../../modules/shell/zsh.nix)
    (import ../../modules/shell/git.nix)
  ];

  modules = {
    shell = {
      git = {
        enable = true;
        userName = "Nate Robbins";
        userEmail = "nate.robbins@trader.ca";
      };
      zsh.enable = true;
    };
  };

  home.packages = with pkgs; [
    iterm2
    postman
    darwin.xcode_14_1
  ];

  # Meta
  home.stateVersion = "22.11";
}
