/*
    *
  Import all my custom modules to make them available everywhere
*/
inputs@{ self, ... }:
{ config, pkgs, ... }:
{
  imports = inputs.self.mylib.modulesInDirRec ./.;
}
