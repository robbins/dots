{
  inputs = {
    # Nixpkgs
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-stable.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.11-darwin";

    # Hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
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
    };

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
    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
  };

  outputs = inputs@{ self, ... }: { # The attribute set argument to outputs taking self + all flakes specified in the inputs attribute can be referred to by 'inputs'
    mylib = import ./lib inputs;
    nixosConfigurations = import ./hosts "linux" inputs;
    darwinConfigurations = import ./hosts "darwin" inputs;
  };
}
