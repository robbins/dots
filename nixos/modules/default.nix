/**
Import all my custom modules to make them available everywhere
*/

inputs@{self, ... }:
{config, pkgs, ... }:
{
  imports = (inputs.self.mylib.modulesInDir ./.);
  #imports = map (file: ./. + "/${file}") (builtins.filter (file: file != "default.nix") (builtins.attrNames (builtins.readDir ./.)));
/*  imports = [
    ./android
    ./hardware
    ./users.nix
    ./services
    ./documentation.nix
    ./gui
  ];*/
}
