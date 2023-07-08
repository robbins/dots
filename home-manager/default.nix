/**
Common home-manager configuration for all home-manager setups
Passes flake inputs & username to the module system, and imports the user's HM config
*/

{ config, lib, pkgs, home-manager, inputs, specialArgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; inherit (specialArgs) username; };
    users.${specialArgs.username} = import (../home-manager/users/${specialArgs.username});
  };
}
