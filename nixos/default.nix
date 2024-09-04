/*
    *
  Common configuration for all NixOS hosts when using flakes
*/
{
  pkgs,
  config,
  lib,
  inputs,
  modulesPath,
  ...
}:
let
  cfg = config.modules.nixos;
in
{
  imports = [
    ((import ../nixos/modules) inputs) # all my custom NixOS modules
    # "${modulesPath}/profiles/perlless.nix" Not working until ryantm/agenix#238 is fixed
    ./security.nix
  ];

  config = lib.mkMerge [
    rec {
      environment.variables.NIXPKGS_ALLOW_UNFREE = "1";

      # Tag each generation with Git hash
      system.configurationRevision = inputs.self.mylib.gitRev inputs;
      system.nixos.label = "GitRev.${config.system.configurationRevision}.Rel.${config.system.nixos.release}";
      environment.etc."os-release".text = "GIT_REV=${system.configurationRevision}\n";

      # Store the activity config in the registry
      nix.registry.active-config.flake = inputs.self;
    }

    # Every bare-metal NixOS machine needs a bootloader
    (lib.mkIf (!config.wsl.enable or false) {
      boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
      boot.loader = {
        timeout = 0;
        systemd-boot = {
          enable = true;
          consoleMode = "max";
          editor = false;
          memtest86.enable = true;
          netbootxyz.enable = true;
        };
        efi.canTouchEfiVariables = true;
      };
    })
  ];
}
