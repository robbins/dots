/*
  *
Common home-manager configuration for all home-manager setups
Passes flake inputs & username to the module system, and imports the user's HM config
*/
{
  config,
  lib,
  pkgs,
  home-manager,
  inputs,
  specialArgs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit (specialArgs) username hostname;
    };
    users.${specialArgs.username} = import ../home-manager/users/${specialArgs.username}-${specialArgs.hostname};
    #users.users."${specialArgs.username}".home = if "${specialArgs.username}" == "naterobbins" then "/Users/${specialArgs.username}" else "/home/${specialArgs.username}"; #TODO terrible hack temp fixes var/empty hm darwin glitch
  };
}
