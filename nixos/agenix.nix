{ config, lib, pkgs, options, inputs, specialArgs, ... }:

with lib;
{
  imports = [ inputs.agenix.nixosModules.default ];
  age = {
    secrets = 
    let
      dirs = (builtins.readDir ../hosts/linux);
      hosts = lib.attrsets.attrNames (lib.attrsets.filterAttrs (n: v: v == "directory") dirs); # TOdo lib function get hosts per platform ig and refactor out to use this everywhere this is linux only
      paths = map (host: "../hosts/linux/${host}/secrets") hosts;
      dir_per_host = lib.attrsets.genAttrs hosts (host: (builtins.readDir (../. + "/hosts/linux/${host}/secrets")));
      files_per_host = lib.attrsets.mapAttrs (name: value: (builtins.attrNames value)) dir_per_host;
      age_files_per_host = lib.attrsets.mapAttrs (name: value: builtins.filter (file: lib.strings.hasSuffix ".age" file) value ) files_per_host;
      age_file_names_per_host = lib.attrsets.mapAttrs (name: value: (map (file: lib.strings.removeSuffix ".age" file) value )) age_files_per_host;
      list = lib.mapAttrsToList (host: files: (lib.genAttrs files (file: {file = ../. + "/hosts/linux/${host}/secrets" + "/${file}.age";}))) age_file_names_per_host;
      agenix_final_attrset = lib.foldl (acc: attr: acc // attr) {} list;



      #path = ../hosts/linux/zephyrus/secrets;
      #files = builtins.attrNames (builtins.readDir path);
      #age_files = builtins.filter (file: lib.strings.hasSuffix ".age" file) files;
      #age_file_names = map (file: lib.strings.removeSuffix ".age" file) age_files;
    #in (genAttrs age_file_names (
    #  attr: 
    #  let
    #    file = (lib.strings.removeSuffix ".file" attr) + ".age";
    #    filePath = path + "/${file}";
    #  in { file = filePath; }
    #));
    in agenix_final_attrset;
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
