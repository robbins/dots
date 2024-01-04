let
  zephyrus_nate = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKRBUkddJz3tBTBwqowuq+S8UvACjAg3XDmrX72fUdTE nate@zephyrus";
  zephyrus_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMyz1Ue1iT9C1ioKxOO8/w/64x6oUcX1QGSXMTbAT6aV root@zephyrus";
in {
#  "nate_user_password.age".publicKeys = [zephyrus_nate zephyrus_host];
     "nate_zephyrus_tailscale_auth_key.age".publicKeys = [ zephyrus_nate zephyrus_host ];
}
