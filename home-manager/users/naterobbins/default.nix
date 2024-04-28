#
# Home-Manager configuration for user nate
#
{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports =
    [
      #    ((import ../../modules) inputs) # all my custom HM modules TODO cant pull up to common iirc for some reason
      inputs.nixvim.homeManagerModules.nixvim
      inputs.nix-index-database.hmModules.nix-index
    ]
    ++ (inputs.self.mylib.modulesInDir ../../modules/shell)
    ++ (inputs.self.mylib.modulesInDir ../../modules/dev);
  modules = {
    dev = {
      shell.enable = true;
    };
    shell = {
      zsh.enable = true;
      ripgrep.enable = true;
      git = {
        enable = true;
        userName = "Nate Robbins";
        userEmail = "nate.robbins@trader.ca";
      };
      ghcli.enable = true;
      neovim.enable = true;
      dircolors.enable = true;
    };
  };

  # Misc
  home.packages = [ ];

  programs.nix-index-database.comma.enable = true;

  # Meta
  home.stateVersion = "22.05";
}
