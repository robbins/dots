{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  inherit (lib) mkEnableOption mkOption mkIf;
  inherit (lib.types) str;
  inherit (inputs.self.mylib.options) mkOpt;
  cfg = config.modules.shell.git;
in
{
  options.modules.shell.git = {
    enable = mkEnableOption "enable";
    userName = mkOpt str "";
    userEmail = mkOpt str "";
  };

  config = mkIf cfg.enable {
    programs.zsh.shellAliases = {
      # Git commands
      g = "git";
      gco = "git checkout";
      gcb = "git checkout -b";
      gcp = "git cherry-pick";
      gs = "git status";
      gsh = "git show";
      ga = "git add";
      gaa = "git add .";
      gc = "git commit";
      gcm = "git commit -m";
      gssl = "git stash show -p";
      gb = "git reset HEAD~1";
      gB = "git reset HEAD~1 --hard";
      # Macros
      fixup = "git add . && git commit --amend --no-edit";
      groot = "cd \"$(git rev-parse --show-toplevel)\"";
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
        co = "checkout";
        cb = "checkout -b";
        cp = "cherry-pick";
        s = "status";
        sh = "show";
        a = "add";
        aa = "add .";
        c = "commit";
        cm = "commit -m";
        ssl = "stash show -p";
        b = "reset HEAD~1";
        B = "reset HEAD~1 --hard";
        "r" = "rebase";
        "ri" = "rebase -i";
        "l" = "log";
        "ll" = "log --graph --pretty --decorate --all";
        "lm" = "log --graph --abbrev-commit --pretty --decorate --all --oneline";
        "unstage" = "git restore --staged";
      };
    };
  };
}
