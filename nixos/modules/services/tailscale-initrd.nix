{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
with lib; let
  cfg = config.modules.services.tailscale-initrd;
  iptables-static = (pkgs.iptables.override { nftablesCompat = false; }).overrideAttrs (old: {
        dontDisableStatic = true;
        configureFlags = (lib.remove "--enable-shared" old.configureFlags) ++ [
          "--enable-static"
          "--disable-shared"
        ];
      });
in {
  options.modules.services.tailscale-initrd = {
    enable = mkOption { default = false; };
    tailscaleStatePath = mkOption { description = "Secret Tailscale state for initrd "; default = config.age.secrets."${specialArgs.username}_${specialArgs.hostname}_tailscale_initrd_state".path; };
  };
  config = mkIf cfg.enable 
    {
      boot.initrd = {
        availableKernelModules = [
          "ip6_tables"
          "ip6table_filter"
          "ip6table_nat"
          "ip6table_raw"
          "ip_tables"
          "iptable_filter"
          "iptable_nat"
          "iptable_raw"
          "nf_conntrack"
          "nf_nat"
          "tun"
          "xt_comment"
          "xt_conntrack"
          "xt_mark"
          "xt_MASQUERADE"
          "xt_LOG"
          "xt_tcpudp"
        ];
        secrets = {
           "/var/lib/tailscale/tailscaled.state" = cfg.tailscaleStatePath;
        };
        systemd = {
          network = {
            enable = true;
          };
          services = {
            networkPostCommands = {
              after = [
                "network-online.target"
              ];
              unitConfig.DefaultDependencies = "no";
              serviceConfig.Type = "oneshot";
              path = with pkgs; [
                tailscale
              ];
              script = ''
                # Bring up tailscaled and dial in
                echo 'nameserver 8.8.8.8' > /etc/resolv.conf
                mkdir /dev/net
                mknod /dev/net/tun c 10 200
                .tailscaled-wrapped 2>/dev/null &
                sleep 5
                .tailscale-wrapped up
                .tailscale-wrapped status
                echo "echo 'Use cryptsetup-askpass to unlock!'" >> /root/.profile
              '';
            };
            mountPostCommands = {
            };
          };
        };
        network = {
          enable = true;
          flushBeforeStage2 = true;
          postCommands = ''
          '';
        };
        extraUtilsCommands = ''
          copy_bin_and_libs ${pkgs.tailscale}/bin/.tailscaled-wrapped
          copy_bin_and_libs ${pkgs.tailscale}/bin/.tailscale-wrapped
          copy_bin_and_libs ${pkgs.iproute}/bin/ip
          copy_bin_and_libs ${iptables-static}/bin/iptables
          copy_bin_and_libs ${iptables-static}/bin/xtables-legacy-multi
          copy_bin_and_libs ${pkgs.strace}/bin/strace
        '';
        postMountCommands = ''
          # tear down tailscale
          pkill .tailscaled-wrapped
          .tailscaled-wrapped --cleanup
        '';
    };
  };
}
