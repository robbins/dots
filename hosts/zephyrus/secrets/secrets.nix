let
  zephyrus_nate = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDKadI/u6iVs4ANQEMvg7wSd3bh9X7GeeL+RqgLEY1Vj nejrobbins@gmail.com";
  zephyrus_host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINa/7K6dFiNO6Gj3RgC31fttdB2a4Rf8MZ0N6fN8KAKg";
in
  {
    "nate_user_password.age".publicKeys = [ zephyrus_nate zephyrus_host ];
  }
