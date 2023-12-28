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

	--Indent
	vim.opt.expandtab = true

        --Per-file indent
        vim.api.nvim_create_autocmd("FileType", {
	  pattern = "c",
	  command = "setlocal shiftwidth=2 tabstop=2"
        })
        vim.api.nvim_create_autocmd("FileType", {
	  pattern = "python",
	  command = "setlocal shiftwidth=4 tabstop=4"
        })
        vim.api.nvim_create_autocmd("FileType", {
	  pattern = "java",
	  command = "setlocal shiftwidth=4 tabstop=4"
        })
        vim.api.nvim_create_autocmd("FileType", {
	  pattern = "rust",
	  command = "setlocal shiftwidth=4 tabstop=4"
        })
        vim.api.nvim_create_autocmd("FileType", {
	  pattern = "kotlin",
	  command = "setlocal shiftwidth=4 tabstop=4"
        })
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

        # Completion Engine
	{
	  plugin = nvim-cmp;
	  type = "lua";
	  config = builtins.readFile ./nvim-cmp.lua;
	}

	{
	  plugin = nvim-treesitter.withAllGrammars;
	  type = "lua";
	  config = builtins.readFile ./nvim-treesitter.lua;
	}

	{
	  plugin = luasnip;
	  type = "lua";
	  config = builtins.readFile ./luasnip.lua;
	}

        cmp_luasnip # Snippets
	cmp-nvim-lsp # Provides LSP snippets to nvim-cmp

        friendly-snippets

        vim-nix

        cmp-async-path
        cmp-latex-symbols
      ];

      extraPackages = with pkgs; [
        nixd
        lua-language-server
      ];
    };
  };
}
