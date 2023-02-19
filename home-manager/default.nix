{ config, lib, pkgs, home-manager, inputs, specialArgs, ... }:

{
  imports = [
#    ((import ./modules) inputs) # all my custom HM modules
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; inherit (specialArgs) username; };
    users.${specialArgs.username} = import (../home-manager/users/${specialArgs.username});
  };
}
