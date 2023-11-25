let
  raphael_nate = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOFDezCzrk25XQKXWts+ISFtNyivW/vuHGzDjWJIMo2L nate@raphael";
  raphael_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGTd6H0NLHdbltc4KEZgz6koT6GkvWKdUdsmHcXt6ClD root@raphael";
in {
  "nate_raphael_user_password.age".publicKeys = [ raphael_host raphael_nate ];
  "nate_raphael_tailscale_auth_key.age".publicKeys = [ raphael_host raphael_nate ];
}
