let
  # Zephyrus
  zephyrus_nate = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEJdynqLamm12hVL9BkzQvKcgTboogGlKONVk4x9BscR nate@zephyrus";
  zephyrus_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMyz1Ue1iT9C1ioKxOO8/w/64x6oUcX1QGSXMTbAT6aV root@zephyrus";
  # Zephyrus-WSL
  zephyrus-wsl_nate = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPaJg71mp7ceJX0n3NpP0J9hHFez4WOG/KQnBuXFFxxK nate@zephyrus-wsl";
  zephyrus-wsl_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILtTif/V1z7cka7/HVPbfTCudIERFwzzEONGyUKXZ5on root@zephyrus-wsl";
  # Bulldozer
  bulldozer_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7XJjZGLuGYfyo9gB2+aZ5sUO8jm+lZxEJX5XejJhL2 root@bulldozer";
  # Raphael
  raphael_nate = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOFDezCzrk25XQKXWts+ISFtNyivW/vuHGzDjWJIMo2L nate@raphael";
  raphael_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGTd6H0NLHdbltc4KEZgz6koT6GkvWKdUdsmHcXt6ClD root@raphael";

  users = [ zephyrus_nate zephyrus-wsl_nate raphael_nate ];
  systems = [ zephyrus_host zephyrus-wsl_host bulldozer_host raphael_host ];
in {
  # Zephyrus
  "nate_zephyrus_user_password.age".publicKeys = [ zephyrus_nate zephyrus_host ];
  "nate_zephyrus_tailscale_auth_key.age".publicKeys = [ zephyrus_nate zephyrus_host ];

  # Zephyrus-WSL
  "nate_zephyrus-wsl_tailscale_auth_key.age".publicKeys = [ zephyrus-wsl_host zephyrus-wsl_nate ];

  # Raphael
  "nate_raphael_user_password.age".publicKeys = [ raphael_host raphael_nate ];
  "nate_raphael_tailscale_auth_key.age".publicKeys = [ raphael_host raphael_nate ];

  # Bulldozer
  "nate_bulldozer_tailscale_auth_key.age".publicKeys = [ bulldozer_host ];
}
