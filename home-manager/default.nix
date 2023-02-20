#
# Common configuration for all home-manager setups
#

{ config, lib, pkgs, home-manager, inputs, specialArgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; inherit (specialArgs) username; };
    users.${specialArgs.username} = import (../home-manager/users/${specialArgs.username});
  };
}
