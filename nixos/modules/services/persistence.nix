{
  config,
  pkgs,
  lib,
  inputs,
  specialArgs,
  ...
}: with lib;
let
  cfg = config.modules.services.persistence.system;
in {
  imports = [
    "${inputs.impermanence}/nixos.nix"
  ];

  options.modules.services.persistence.system = {
    enable = mkEnableOption "System Persistence";
    persistenceRoot = mkOption {
			default = "/persist";
			type = types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    security.sudo.extraConfig = ''
      Defaults lecture = never
    '';

    environment.persistence."${cfg.persistenceRoot}" = {
      hideMounts = true;
      files =
        [
          {
            file = "/etc/machine-id";
            parentDirectory = {
              user = "root";
              group = "root";
            };
          }
        ]
        ++ (
          if (config.modules.hardware.networking.wifi.enable)
          then [
#            "/etc/ssl/certs/UofT.pem"
#            "/etc/ssl/certs/ca_radius_2022.pem"
          ]
          else []
        )
        ++ (
          if (config.modules.services.ssh.enable)
          then [
            "/etc/ssh/ssh_host_rsa_key"
            "/etc/ssh/ssh_host_rsa_key.pub"
            "/etc/ssh/ssh_host_ed25519_key"
            "/etc/ssh/ssh_host_ed25519_key.pub"
          ]
          else []
        );
      users."${specialArgs.username}" = {
        directories = [
	  ".ssh"
#          "downloads"
#          "pictures"
#          "music"
#          "videos"

#          ".config/discord"
#          ".config/microsoft-edge-dev"
#          ".config/gtk-3.0"
#          ".config/gtk-4.0"
#          ".config/Google"
#          ".config/JetBrains"
#          ".config/BraveSoftware"
#          ".config/paperwm"

#          ".local/share/icons"
#          ".local/share/direnv/allow"
#          ".local/share/TelegramDesktop"
#          ".local/share/backgrounds"
#          ".local/share/PrismLauncher"
#          ".local/state/nix/profiles"

#          ".cache/microsoft-edge-dev"
#          ".cache/jdtls"
#          ".cache/Google"

#          ".icons"
#          ".minecraft"
#          ".ssh"
#          ".android"
#          ".gradle"
#          ".themes"
        ];
        files = [
#          ".config/gh/hosts.yml"
        ];
      };
    };
  };
}
