#
# Home-Manager configuration for user nate
#

{ config, pkgs, inputs, ... }:
{
  imports = [
    ((import ../../modules) inputs) # all my custom HM modules
  ];
  modules = {
    services = {
      persistence.home.enable = true;
    };
  };

# Meta
  home.stateVersion = "21.05";
}
