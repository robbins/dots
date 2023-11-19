/*
  *
Common configuration for all NixOS hosts when using flakes
*/
{
  config,
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

    nix.registry.nixpkgs.flake = cfg.localNixpkgs;

    # Store the flake's Nixpkgs input to use with tooling that doesn't support flakes
    environment.etc."nixos/nixpkgs".source = cfg.localNixpkgs;
    nix.nixPath = ["nixpkgs=${cfg.localNixpkgs}"];

		nix.registry.activeconfig.flake = inputs.self;
  	environment.etc."nixos/activeconfig".source = inputs.self;
  }

  (lib.mkIf (!config.wsl.enable or false) {
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
