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
      zsh-autocomplete
      zsh-syntax-highlighting
      zsh-powerlevel10k
      zsh-completions
      zsh-vi-mode
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
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
        source ${pkgs.zsh-autocomplete}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
      '';
      initExtraBeforeCompInit = ''
        fpath=(${pkgs.zsh-completions}/share/zsh/site-functions $fpath)
      '';
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;

      sessionVariables = rec {
        EDITOR = "vim";
        VISUAL = EDITOR;
        GIT_EDITOR = EDITOR;
      };
      plugins = [
        {
            name = "powerlevel10k-config";
            src = ./.;
            file = "p10k.zsh";
        }
      ];
    };
  };
}
