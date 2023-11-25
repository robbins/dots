let
  zephyrus-wsl_nate = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPaJg71mp7ceJX0n3NpP0J9hHFez4WOG/KQnBuXFFxxK nate@zephyrus-wsl";
  zephyrus-wsl_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILtTif/V1z7cka7/HVPbfTCudIERFwzzEONGyUKXZ5on root@zephyrus-wsl";
in {
  "nate_zephyrus-wsl_tailscale_auth_key.age".publicKeys = [ zephyrus-wsl_host zephyrus-wsl_nate ];
}
