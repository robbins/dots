#
# Where NixDarwin & Home-Manager modules are imported
# { ... }: part of the module system
#

{ config, pkgs, lib, inputs, options, specialArgs, ... }:

{
  imports = [
  ];

  system = {
    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
      };
    };
  };

  # Misc
  system.stateVersion = 4;
  # programs.zsh.enable = true;
}
