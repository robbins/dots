{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.shell.git;
in {
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
      delta.enable = true;
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
