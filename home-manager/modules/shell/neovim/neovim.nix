{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.shell.neovim;
in {
  options.modules.shell.neovim = {
    enable = mkEnableOption "Neovim";
  };

  config = mkIf cfg.enable {
    programs.zsh.shellAliases = {
      v = "nvim";
    };
    programs.neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = ''
        --Line Numbers
	vim.opt.relativenumber = true
	vim.opt.number = true
	vim.opt.wrap = false
	vim.opt.numberwidth = 1
      '';

      plugins = with pkgs.vimPlugins; [
        {
	  plugin = gruvbox-nvim;
	  type = "lua";
	  config = builtins.readFile ./gruvbox-nvim.lua;
	}
	
	{
	  plugin = nvim-lspconfig;
	  type = "lua";
	  config = builtins.readFile ./nvim-lspconfig.lua;
	}
      ];

      extraPackages = with pkgs; [
        nixd
      ];
    };
  };
}
