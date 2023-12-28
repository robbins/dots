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
    home.file."./.config/nvim/jdtls_setup.lua" = {
      source = ./jdtls_setup.lua;
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

        vim.api.nvim_create_autocmd("FileType", {
          pattern = "java",
          callback = require('jdtls_setup').setup()
        })

        vim.opt.incsearch = true
        vim.opt.guicursor = ""
        vim.opt.scrolloff = 8
        vim.opt.signcolumn = "yes"

        vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
        vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
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

	{
	  plugin = lualine-nvim;
	  type = "lua";
	  config = builtins.readFile ./lualine-nvim.lua;
	}

	{
	  plugin = telescope-nvim;
	  type = "lua";
	  config = builtins.readFile ./telescope-nvim.lua;
	}

        telescope-fzf-native-nvim

        cmp_luasnip # Snippets
	cmp-nvim-lsp # Provides LSP snippets to nvim-cmp

        friendly-snippets

        vim-nix

        cmp-async-path
        cmp-latex-symbols

        nvim-treesitter-context

        nvim-jdtls
      ];

      extraPackages = with pkgs; [
        nixd
        lua-language-server
        jdt-language-server
      ];
    };
  };
}
