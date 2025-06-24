{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
with lib;
let
  cfg = config.modules.shell.zsh;
in
{
  options.modules.shell.zsh = {
    enable = mkEnableOption "Zsh";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      #zsh-powerlevel10k
      zsh-completions
      zsh-autocomplete #?
    ];
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.zsh = {
      enable = true;
      shellAliases = {
        l = "ls -lah";
        ls = "ls --color";
      };
      autocd = true;
      history = {
        save = 1000000000;
        size = 1000000000;
        path =
          if osConfig.modules.services.persistence.system.enable or false == true then
            "/persist${config.xdg.dataHome}/zsh/zsh_history"
          else
            "${config.xdg.dataHome}/zsh/zsh_history";
      };
      sessionVariables = rec {
        # Editor
        EDITOR = "vim";
        VISUAL = EDITOR;
        GIT_EDITOR = EDITOR;

        # FZF
        FZF_COMPLETION_OPTS = "--bind='tab:down,btab:up'";
        FZF_COMPLETION_AUTO_COMMON_PREFIX = true;
        FZF_COMPLETION_AUTO_COMMON_PREFIX_PART = true;
      };
      historySubstringSearch.enable = true;
      initExtra = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        # basic file preview for ls (you can replace with something more sophisticated than head)
        zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'
        zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'
        zstyle ':completion::*:git::*,[a-z]*' fzf-completion-opts --preview='eval set -- {+1}; for arg in "$@"; do [[ -f "$arg" || -e "$arg" ]] && git diff --color=always -- "$arg" || true; [[ -f "$arg" || -e "$arg" ]] && git log --color=always -- "$arg" || true; done'
      '';
      #  bindkey -M menuselect '\r' accept-line
      #  source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      #'';
      initExtraBeforeCompInit = ''
        zstyle ':autocomplete:*' fzf-completion yes
        zstyle ':autocomplete:*' widget-style menu-select
        fpath=(${pkgs.zsh-completions}/share/zsh/site-functions $fpath)
      '';
      autosuggestion.enable = true;
      #enableCompletion = false;
      syntaxHighlighting = {
        enable = true;
        highlighters = [
          "main"
          "brackets"
        ];
      };
      plugins = [
        {
          name = "fzf-tab-completion";
          file = "zsh/fzf-zsh-completion.sh";
          src = pkgs.fetchFromGitHub {
            owner = "lincheney";
            repo = "fzf-tab-completion";
            rev = "4850357beac6f8e37b66bd78ccf90008ea3de40b";
            sha256 = "sha256-pgcrRRbZaLoChVPeOvw4jjdDCokUK1ew0Wfy42bXfQo=";
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
