{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.types) str;
  inherit (inputs.self.mylib.options) mkOpt;
  cfg = config.modules.shell.ghcli;
in
{
  options.modules.shell.ghcli = {
    enable = mkEnableOption "GitHub CLI";
    gitProtocol = mkOpt str "https";
  };

  config = mkIf cfg.enable {
    programs.gh-dash.enable = true;
    programs.gh = {
      enable = true;
      settings = {
        git_protocol = cfg.gitProtocol;
        aliases = {
          "rec" = "release create";
          red = "release delete";
          redl = "release download";
          rel = "release list";
          rev = "release view";
          rc = "repo create";
          rcl = "repo clone";
          rf = "repo fork";
          rl = "repo list";
          rv = "repo view";
        };
      };
    };
  };
}
