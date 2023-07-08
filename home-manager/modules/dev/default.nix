{ config, lib, pkgs, inputs, ... }:

{
  imports = inputs.self.mylib.modulesInDir ./.;
}
