{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.shell.zsh;
in
{
  options.modules.shell.zsh = {
    enable = mkEnableOption "ZSH";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zsh-autosuggestions
      zsh-syntax-highlighting
      zsh-powerlevel10k
      zsh-completions
      fzf
    ];
    programs.zsh = {
      enable = true;
      shellAliases = {
        l = "ls -lah";
        ls = "ls --color";
      };
      autocd = true;
      history = {
        save = 100000;
        size = 100000;
      };
      historySubstringSearch.enable = true;
      initExtra = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      '';
      initExtraBeforeCompInit = ''
        source ${pkgs.zsh-autocomplete}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
        fpath=(${pkgs.zsh-completions}/share/zsh/site-functions $fpath)
      '';
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      plugins = [
        {
          name = "zsh-autocomplete";
          src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "5cc9da132e7535a540fb1235ce27fd5a233d4f0e";
          sha256 = "sha256-+w9+d7cYmPBdnqWgooh+OmscavB9JL7dVqOQyj8jJ7E=";
          };
        }
        {
          name = "powerlevel10k-config";
          src = ./.;
          file = "p10k.zsh";
        }
      ];
    };
  };
}
