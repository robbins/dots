#
# Import all required modules to make them available everywhere
#

inputs@{self, ... }:
{
  imports = [
    ./android
    ./hardware
    ./user/users.nix
    ./services/ssh.nix
    ./services/persistence.nix
    ./hardware/networking/default.nix
  ];
}
