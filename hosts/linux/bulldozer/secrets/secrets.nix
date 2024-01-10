let
  bulldozer_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7XJjZGLuGYfyo9gB2+aZ5sUO8jm+lZxEJX5XejJhL2 root@bulldozer";
in {
  "nate_bulldozer_tailscale_auth_key.age".publicKeys = [ bulldozer_host ];
}
