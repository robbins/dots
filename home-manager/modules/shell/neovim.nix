{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.shell.neovim;
in
{
  options.modules.shell.neovim = {
    enable = mkEnableOption "Neovim";
  };

  config = mkIf cfg.enable {
    programs.zsh.shellAliases = {
      v = "vim";
    };
    programs.nixvim = {
      enable = true;
      vimAlias = true;
      colorschemes.gruvbox.enable = true;
      options = {
        number = true;
	relativenumber = true;
	numberwidth = 1;
	wrap = true;
      };
      plugins = {
        treesitter.enable = true;
      };
      extraConfigLua = ''
        vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
      '';
    };
  };
}
