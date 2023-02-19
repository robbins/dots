{ config, lib, pkgs, options, inputs, specialArgs, ... }:

with lib;
{
  imports = [ inputs.agenix.nixosModules.default ];
  age = {
    secrets = {
      #TODO: generate these mappings automatically
      nate_user_password.file = lib.mkForce ../hosts/zephyrus/secrets/nate_user_password.age;
    };
    identityPaths =
      options.age.identityPaths.default ++ (filter pathExists [
        (config.users.users.${specialArgs.username}.home + "/.ssh/id_ed2519_${config.networking.hostName}")
      ]);
  };

}
