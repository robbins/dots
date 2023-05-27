#
# Common configuration for all Darwin hosts when using flakes
#

{ config, pkgs, lib, inputs, ...}:

let 
  cfg = config.modules.darwin;
  gitRev = if (inputs.self ? rev) then inputs.self.shortRev else throw "Refusing to build from a dirty Git tree!";
in
{
  imports = [
    # ((import ../darwin/modules) inputs) # all my custom Darwin modules, none for now
  ];

  options.modules.darwin = {
    localNixpkgs = lib.mkOption {};
  };

  config = {
    environment.variables.NIXPKGS_ALLOW_UNFREE = "1";

    # Tag each generation with Git hash
    system.darwinLabel = "GitRev.${gitRev}.Rel.${config.system.nixpkgsRelease}";

    # Store the flake's Nixpkgs input to use with tooling that doesn't support flakes
    environment.etc."nixdarwin/nixpkgs".source = cfg.localNixpkgs;
    nix.nixPath = [ "/etc/nixos" ];

    nix.registry.nixpkgs.flake = inputs.nixos-unstable;

    nix.useDaemon = true;
    services.nix-daemon.enable = true;
  };
}
