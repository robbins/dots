{ config, pkgs, inputs, ... }:
{
  imports = [
  ];

  home.packages = with pkgs; [
    iterm2
  ];

  # Meta
  home.stateVersion = "22.11";
}
