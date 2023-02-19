{ config, pkgs, inputs, ... }:
{
  imports = [
    ((import ../../modules) inputs) # all my custom HM modules
  ];
  home.stateVersion = "21.05";
}
