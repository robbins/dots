#
# Common NixOS configuration when using flakes
#

{ config, pkgs, inputs, ...}:

{
  imports = [
    ./nixconf.nix
  ];

  environment.etc."nixos/nixpkgs".source = inputs.nixos-unstable;
  environment.etc."os-release".text = "GIT_REV=${inputs.self.shortRev}\n";
  system.configurationRevision = if (inputs.self ? rev) then inputs.self.shortRev else throw "Refusing to build from a dirty Git tree!";
  system.nixos.label = "GitRev.${config.system.configurationRevision}.Rel.${config.system.nixos.release}";
}
