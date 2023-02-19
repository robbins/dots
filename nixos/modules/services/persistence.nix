{ config, pkgs, lib, inputs, ... }:
let cfg = config.modules.services.persistence.system;
in {
  imports = [
    "${inputs.impermanence}/nixos.nix"
  ];

  options.modules.services.persistence.system = { 
    enable = lib.mkEnableOption "enable"; 
  };

  config = lib.mkIf cfg.enable {
    security.sudo.extraConfig = ''
      Defaults lecture = never
    '';

    programs.fuse.userAllowOther = lib.mkIf (config.home-manager.users.nate.modules.services.persistence.home.enable) true;
    #TODO: this should be a generic module, not hardcoded to nate user

    systemd.tmpfiles.rules = if (config.modules.hardware.networking.wifi.enable) then [
    "L /var/lib/iwd/UofT.8021x - - - - /persist/var/lib/iwd/UofT.8021x"
    "L /var/lib/iwd/eduroam.8021x - - - - /persist/var/lib/iwd/eduroam.8021x"
    "L /var/lib/iwd/BELL289.psk - - - - /persist/var/lib/iwd/BELL289.psk"
    "L /var/lib/iwd/hedgehog_house.psk - - - - /persist/var/lib/iwd/hedgehog_house.psk"
  ] else [];

    environment.persistence."/persist" = {
      files = [
        { file = "/etc/machine-id"; parentDirectory = { user = "root"; group = "root"; }; }
      ] ++ (if (config.modules.hardware.networking.wifi.enable) then [
        "/etc/ssl/certs/UofT.pem"
        "/etc/ssl/certs/ca_radius_2022.pem"
      ] else []) ++ (if (config.modules.services.ssh.enable) then [
        "/etc/ssh/ssh_host_rsa_key"
        "/etc/ssh/ssh_host_rsa_key.pub"
        "/etc/ssh/ssh_host_ed25519_key"
        "/etc/ssh/ssh_host_ed25519_key.pub"
      ] else []);
      directories = (if (config.modules.hardware.networking.wifi.enable) then [
#        "/var/lib/iwd" # This makes /var owned by nate:users and not root:root
#        { file = "/var/lib/iwd"; parentDirectory = { user = "root"; group = "root"; }; }
      ] else []);
    };
  };
}
