{
  inputs = {
    # Nixpkgs
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-stable.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    home-manager-darwin = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Darwin
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Modules
    impermanence.url = "github:nix-community/impermanence";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixos-unstable";
      inputs.darwin.follows = "";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";

    # Programs
    hyprland = {
      url = "github:vaxerski/Hyprland";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    minidev = {
      url = "github:robbins/minidev";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
  };

  outputs =
    args@{ self, ... }: # The parameter of the lambda bound to outputs that takes self and all flakes specified in the inputs attribute can be referred to by 'args', and is renamed to 'inputs' when passed to the module system via specialArgs/extraSpecialArgs.
    let
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = function:
      args.nixpkgs.lib.genAttrs supportedSystems (system: function args.nixpkgs.legacyPackages.${system});
    in 
    {
      inherit self;
      mylib = import ./lib args;
      formatter.x86_64-linux = args.nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      formatter.aarch64-darwin = args.nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;
      nixosConfigurations = import ./hosts "linux" args;
      darwinConfigurations = import ./hosts "darwin" args;
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.just
            pkgs.nix-output-monitor
            pkgs.nh
            args.agenix.packages.${pkgs.system}.default
            pkgs.nix-inspect
          ];
        };
      });
    };
}
