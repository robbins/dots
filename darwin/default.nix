#
# Common configuration for all Darwin hosts when using flakes
#
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  cfg = config.modules.darwin;
in
{
  imports = [
    # ((import ../darwin/modules) inputs) # all my custom Darwin modules, none for now
  ];

  options.modules.darwin = {
    localNixpkgs = lib.mkOption { };
  };

  config = rec {
    environment.variables.NIXPKGS_ALLOW_UNFREE = "1";

    # Tag each generation with Git hash
    system.configurationRevision = inputs.self.mylib.gitRev inputs;
    system.darwinLabel = "GitRev.${system.configurationRevision}.Rel.${config.system.nixpkgsRelease}";

    # Store the flake's Nixpkgs input to use with tooling that doesn't support flakes
    environment.etc."nixdarwin/nixpkgs".source = cfg.localNixpkgs;
    nix.nixPath = [ "/etc/nixos" ];

    nix.registry.nixpkgs.flake = inputs.nixos-unstable;

    nix.useDaemon = true;
    services.nix-daemon.enable = true;

    # Some nice MacOS defaults
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
  };
}
