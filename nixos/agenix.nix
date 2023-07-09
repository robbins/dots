{ config, lib, pkgs, options, inputs, specialArgs, ... }:

with lib;
with inputs.self.mylib;
{
  imports = [ inputs.agenix.nixosModules.default ];
  age = {
    secrets = 
    let
      hostSecretsDir = attrsets.genAttrs nixosHosts (host: (builtins.readDir (../. + "/hosts/linux/${host}/secrets")));
      hostSecretsDirFiles = attrsets.mapAttrs (name: value: (builtins.attrNames value)) hostSecretsDir;
      hostAgeSecretFiles = attrsets.mapAttrs (name: value: builtins.filter (file: strings.hasSuffix ".age" file) value ) hostSecretsDirFiles;
      hostAgeSecretNames = attrsets.mapAttrs (name: value: (map (file: strings.removeSuffix ".age" file) value )) hostAgeSecretFiles;
      secretToFileMap = mapAttrsToList (host: files: (genAttrs files (file: {file = (lib.mkForce (../. + "/hosts/linux/${host}/secrets" + "/${file}.age"));}))) hostAgeSecretNames;
    in foldl (acc: attr: acc // attr) {} secretToFileMap;
    identityPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ]; #TODO: this is specific

/*    identityPaths =
      options.age.identityPaths.default ++ (filter pathExists [
        (config.users.users.${specialArgs.username}.home + "/.ssh/id_ed25519_${config.networking.hostName}")
	"/persist/etc/ssh/ssh_host_ed25519_key"
	]);*/
  };

}
