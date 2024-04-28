/*
    *
  Common configuration for all NixOS hosts when using flakes
*/
{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
let
  cfg = config.modules.nixos;
in
{
  imports = [
    ((import ../nixos/modules) inputs) # all my custom NixOS modules
    ./security.nix
  ];

  options.modules.nixos = {
    localNixpkgs = lib.mkOption { };
  };

  config = lib.mkMerge [
    rec {
      environment.variables.NIXPKGS_ALLOW_UNFREE = "1";

      # Tag each generation with Git hash
      system.configurationRevision = inputs.self.mylib.gitRev inputs;

      system.nixos.label = "GitRev.${config.system.configurationRevision}.Rel.${config.system.nixos.release}";
      environment.etc."os-release".text = "GIT_REV=${system.configurationRevision}\n";

      nix.registry.nixpkgs.flake = cfg.localNixpkgs;

      # Store the flake's Nixpkgs input to use with tooling that doesn't support flakes
      environment.etc."nixos/nixpkgs".source = cfg.localNixpkgs;
      nix.nixPath = [ "nixpkgs=${cfg.localNixpkgs}" ];

      nix.registry.activeconfig.flake = inputs.self;
      environment.etc."nixos/activeconfig".source = inputs.self;
    }

    # Every bare-metal NixOS machine needs a bootloader
    (lib.mkIf (!config.wsl.enable or false) {
      boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
      boot.loader = {
        timeout = 0;
        systemd-boot = {
          enable = true;
        };
        efi.canTouchEfiVariables = true;
      };
    })
  ];
}
