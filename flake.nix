{
  inputs = {
    # Nixpkgs
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-stable.url = "github:nixos/nixpkgs/nixos-22.11";
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    # Modules
    impermanence.url = "github:nix-community/impermanence";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    # Programs
    hyprland.url = "github:vaxerski/Hyprland";
    comma = {
      url = "github:nix-community/comma";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    minidev = {
      url = "github:robbins/minidev";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
  };

  outputs = inputs@{ self, ... }: {
    nixosConfigurations = import ./hosts inputs;
  };
}
