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
  ];
}
