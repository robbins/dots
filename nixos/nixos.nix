#
# Common NixOS configuration when using flakes
#

{ config, pkgs, lib, inputs, ...}:

let cfg = config.modules.nixos;
in
{
  imports = [
  ];

  options.modules.nixos = {
    localNixpkgs = lib.mkOption {};
  };

  config = {
    environment.etc."nixos/nixpkgs".source = cfg.localNixpkgs;
    environment.etc."os-release".text = "GIT_REV=${inputs.self.shortRev}\n";
    system.configurationRevision = if (inputs.self ? rev) then inputs.self.shortRev else throw "Refusing to build from a dirty Git tree!";
    system.nixos.label = "GitRev.${config.system.configurationRevision}.Rel.${config.system.nixos.release}";
  };

}
