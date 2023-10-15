/*
  *
Common configuration for all NixOS hosts when using flakes
*/
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  cfg = config.modules.nixos;
in {
  imports = [
    ((import ../nixos/modules) inputs) # all my custom NixOS modules
    ./security.nix
  ];

  options.modules.nixos = {
    localNixpkgs = lib.mkOption {};
  };

  config = lib.mkMerge [
  {
    environment.variables.NIXPKGS_ALLOW_UNFREE = "1";

    # Tag each generation with Git hash
    system.configurationRevision =
      if (inputs.self ? rev)
      then inputs.self.shortRev
      else throw "Refusing to build from a dirty Git tree!";
    system.nixos.label = "GitRev.${config.system.configurationRevision}.Rel.${config.system.nixos.release}";
    environment.etc."os-release".text = "GIT_REV=${inputs.self.shortRev}\n";

    # Store the flake's Nixpkgs input to use with tooling that doesn't support flakes
    environment.etc."nixos/nixpkgs".source = cfg.localNixpkgs;
    nix.nixPath = ["/etc/nixos"];

    nix.registry.nixpkgs.flake = inputs.nixos-unstable;
  }

  (lib.mkIf (config.wsl.enable or false == false) {
    # Every NixOS machine needs a bootloader - always systemd-boot
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
