let
  zephyrus_nate_user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDKadI/u6iVs4ANQEMvg7wSd3bh9X7GeeL+RqgLEY1Vj nejrobbins@gmail.com";
  zephyrus_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOQKEYCOgszI8QsvDpdxGpg3VF4LN3fycyVkjgpy7cFA";
in
  {
    "nate_user_password.age".publicKeys = [ zephyrus_nate_user zephyrus_host ];
  }
