{ config, pkgs, inputs, ... }:
{
  imports = [
    (../../modules/shell/git.nix) inputs
  ];

  modules = {
    shell = {
      git = {
        enable = true;
        userName = "Nate Robbins";
        userEmail = "nate.robbins@trader.ca";
      };
    };
  };

  home.packages = with pkgs; [
    iterm2
  ];

  # Meta
  home.stateVersion = "22.11";
}
