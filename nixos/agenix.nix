{ config, lib, pkgs, options, inputs, specialArgs, ... }:

with lib;
{
  imports = [ inputs.agenix.nixosModules.default ];
  age = {
    secrets = 
    let
      path = ../hosts/linux/zephyrus/secrets;
      files = builtins.attrNames (builtins.readDir path);
      age_files = builtins.filter (file: lib.strings.hasSuffix ".age" file) files;
      age_file_names = map (file: lib.strings.removeSuffix ".age" file) age_files;
      age_file_names_dotfile = map (file: file + ".file" ) age_file_names;
    in (genAttrs age_file_names (
      attr: 
      let
        file = (lib.strings.removeSuffix ".file" attr) + ".age";
        filePath = path + "/${file}";
      in { file = filePath; }
    ));
    /*{
      #TODO: generate these mappings automatically
      nate_user_password.file = lib.mkForce ../hosts/linux/zephyrus/secrets/nate_user_password.age;
    };*/
    identityPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ]; #TODO: this is specific
#      options.age.identityPaths.default ++ (filter pathExists [
#        (config.users.users.${specialArgs.username}.home + "/.ssh/id_ed2519_${config.networking.hostName}")
#        "/persist/etc/ssh/ssh_host_ed25519_key"
#      ]);
  };

}
