#
# Import all required modules to make them available everywhere
#

inputs@{self, ... }:
{
  imports = [
    ./android
    ./hardware
    ./users.nix
    ./services
    ./hardware/networking
  ];
}
