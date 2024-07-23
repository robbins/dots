{
  inputs = {
    # Nixpkgs
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-stable.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    home-manager-darwin = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Darwin
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Modules
    impermanence.url = "github:nix-community/impermanence";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixos-unstable";
      inputs.home-manager.follows = "home-manager"; #TODO: Not perfect as Darwin systems are now limited to nixos-unstable as opposed to nixpkgs
      inputs.darwin.follows = "darwin";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nur.url = "github:nix-community/NUR";

    # Programs
    neovim-nix = {
      url = "github:robbins/neovim-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    minidev = {
      url = "github:robbins/minidev";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    firefox-nightly = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
    };
    ags.url = "github:Aylur/ags";
    nixpkgs-cuttlefish.url = "github:robbins/nixpkgs/cuttlefish-on-unstable";
  };

  outputs =
    args@{ self, ... }: # The parameter of the lambda bound to outputs that takes self and all flakes specified in the inputs attribute can be referred to by 'args', and is renamed to 'inputs' when passed to the module system via specialArgs/extraSpecialArgs.
    let
      inherit (args.nixpkgs-unstable.lib) genAttrs;
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems =
        function:
        genAttrs supportedSystems (
          system:
          function (
            # Forced to have a second eval of nixpkgs* here because we want this to use nixpkgs-unstable, but Linux systems use nixos-unstable. Darwin systems could share but I'd prefer to keep it consistent.
            import args.nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
              overlays = [ args.neovim-nightly.overlays.default ];
            }
          )
        );
    in
    {
      inherit self;

      mylib = import ./lib args;
      formatter.x86_64-linux = args.nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      formatter.aarch64-darwin = args.nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;

      nixosConfigurations = import ./hosts "linux" args;
      darwinConfigurations = import ./hosts "darwin" args;

      packages =
        let
          pnames = builtins.filter (name: name != "neovim") (builtins.attrNames (builtins.readDir ./packages));
        in
        forAllSystems (pkgs: genAttrs pnames (pname: pkgs.callPackage ./packages/${pname} { }));

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.just
            pkgs.nix-output-monitor
            pkgs.nh
            args.agenix.packages.${pkgs.system}.default
            pkgs.nix-inspect
            args.neovim-nix.packages.${pkgs.system}.default
          ];
        };
      });
    };
}
