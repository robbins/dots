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

	{
	  plugin = nvim-cmp;
	  type = "lua";
	  config = builtins.readFile ./nvim-cmp.lua;
	}

	{
	  plugin = (nvim-treesitter.withPlugins (p: [
	  p.tree-sitter-nix
	  p.tree-sitter-vim
	  p.tree-sitter-uiua
	  p.tree-sitter-sql
	  p.tree-sitter-r
	  p.tree-sitter-python
	  p.tree-sitter-make
	  p.tree-sitter-lua
	  p.tree-sitter-markdown
	  p.tree-sitter-latex
	  p.tree-sitter-kotlin
	  p.tree-sitter-java
	  p.tree-sitter-json
	  p.tree-sitter-go
	  p.tree-sitter-c
	  p.tree-sitter-bash
	]));
	  type = "lua";
	  config = builtins.readFile ./nvim-treesitter.lua;
	}

	luasnip
	cmp-nvim-lsp
      ];

      extraPackages = with pkgs; [
        nixd
      ];
    };
  };
}
