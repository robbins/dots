{
  options,
  lib,
  inputs,
  specialArgs,
  ...
}:
with lib;
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
    identityPaths = options.age.identityPaths.default ++ [ "/persist/etc/ssh/ssh_host_ed25519_key" ]; # TODO: this is specific, also only needed if / is on tmpfs (secrets are needed decrypted before etc/ssh is available and mounted by impermanence, so get it from the source)

    /*
           identityPaths =
           options.age.identityPaths.default ++ (filter pathExists [
             (config.users.users.${specialArgs.username}.home + "/.ssh/id_ed25519_${config.networking.hostName}")
      "/persist/etc/ssh/ssh_host_ed25519_key"
      ]);
    */
  };
}
