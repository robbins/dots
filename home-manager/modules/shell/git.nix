{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkOption mkIf;
  cfg = config.modules.shell.git;
in
{
  options.modules.shell.git = {
    enable = mkEnableOption "enable";
    userName = mkOption {
      type = lib.types.str;
      default = "";
    };
    userEmail = mkOption {
      type = lib.types.str;
      default = "";
    };
  };

  config = mkIf cfg.enable {
    programs.zsh.shellAliases = {
      g = "git";
      fixup = "git add . && git commit --amend --no-edit";
    };
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
      delta = {
        enable = true;
        options = {
          decorations = {
            commit-decoration-style = "bold yellow box ul";
            file-decoration-style = "none";
            file-style = "bold yellow ul";
          };
          unobtrusive-line-numbers = {
            line-numbers = true;
            line-numbers-minus-style = "#444444";
            line-numbers-zero-style = "#444444";
            line-numbers-plus-style = "#444444";
            line-numbers-left-format = "{nm:>4}┊";
            line-numbers-right-format = "{np:>4}│";
            line-numbers-left-style = "blue";
            line-numbers-right-style = "blue";
          };
          merge = {
            conflictstyle = "diff3";
          };
          features = "decorations unobtrusive-line-numbers";
          whitespace-error-style = "22 reverse";
        };
      };
      aliases = {
        "s" = "status";
        "c" = "commit";
        "cm" = "commit -m";
        "co" = "checkout";
        "sh" = "show";
        "a" = "add";
        "aa" = "add .";
        "r" = "rebase";
        "ri" = "rebase -i";
        "l" = "log";
        "ll" = "log --graph --pretty --decorate --all";
        "lm" = "log --graph --abbrev-commit --pretty --decorate --all --oneline";
      };
    };
  };
}
