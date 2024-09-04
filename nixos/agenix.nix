{
  config,
  options,
  lib,
  inputs,
  specialArgs,
  ...
}:

{
  imports = [ inputs.agenix.nixosModules.default ];

  age = {
    secrets =
      let
        ageSecretFiles = (
          builtins.filter (file: (lib.hasSuffix ".age") file) (
            builtins.attrNames (builtins.readDir (../secrets))
          )
        );
        ageSecretFilesForHostname = (
          builtins.filter (
            file: ((lib.hasInfix "${specialArgs.hostname}" file) || (lib.hasInfix "global" file))
          ) ageSecretFiles
        );
        ageSecrets = (
          map (secretFile: lib.strings.removeSuffix ".age" secretFile) ageSecretFilesForHostname
        );
        secretFileToPath = (
          lib.genAttrs ageSecrets (secret: {
            file = (../secrets + "/${secret}.age");
          })
        );
      in
      secretFileToPath;

    # If impermanence is enabled ssh keys are needed before impermanence places them in /etc/ssh, so get them directly from persistent storage
    identityPaths =
      options.age.identityPaths.default
      ++ (lib.optionals config.modules.services.persistence.system.enable [
        "${config.modules.services.persistence.system.persistenceRoot}/etc/ssh/ssh_host_ed25519_key"
      ]);
  };
}
