#
# Import all required modules to make them available everywhere
#

inputs@{self, ... }:
{
  imports = [
    ./services
    ./gui
    ./dev
    ./shell
  ];
}
