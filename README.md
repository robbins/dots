# Nix-based system & user configuration for Linux & macOS

# Structure
[common](common): General configuration that can be applied to all systems.

[lib](lib): Helper functions.

[nixos](nixos): Common configuration for NixOS-based systems & my custom NixOS modules.

[darwin](darwin): Common configuration for macOS-based systems (no custom modules yet!).

[hosts](hosts): Machine-specific configuration for NixOS and macOS.

[home-manager/homes](home-manager/homes): User-specific home-manager configs for each system.

[home-manager/modules](home-manager/modules): My custom home-manager modules.

[scripts](scripts): Misc. scripts.

[secrets](secrets): Encrypted secrets managed with Agenix.

# Management
Just run `just`.
