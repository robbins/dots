#
# Where NixDarwin & Home-Manager modules are imported
# { ... }: part of the module system
#
{
  config,
  pkgs,
  lib,
  inputs,
  options,
  specialArgs,
  ...
}:
{
  imports = [ ];

  system = {
    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.35;
      };
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
      };
    };
  };

  environment.systemPackages = with pkgs; [ xcodes ];

  # Misc
  system.stateVersion = 4;
  programs.zsh.enable = true;
}
