{ config, lib, pkgs, options, inputs, specialArgs, ... }:

with lib;
with inputs.self.mylib;
{
  imports = [ inputs.agenix.nixosModules.default ];
  age = {
    secrets = 
    let
      hosts = nixosHosts;
      dir_per_host = attrsets.genAttrs hosts (host: (builtins.readDir (../. + "/hosts/linux/${host}/secrets")));
      files_per_host = attrsets.mapAttrs (name: value: (builtins.attrNames value)) dir_per_host;
      age_files_per_host = attrsets.mapAttrs (name: value: builtins.filter (file: strings.hasSuffix ".age" file) value ) files_per_host;
      age_file_names_per_host = attrsets.mapAttrs (name: value: (map (file: strings.removeSuffix ".age" file) value )) age_files_per_host;
      mappings = mapAttrsToList (host: files: (genAttrs files (file: {file = ../. + "/hosts/linux/${host}/secrets" + "/${file}.age";}))) age_file_names_per_host;
      in foldl (acc: attr: acc // attr) {} mappings;
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
