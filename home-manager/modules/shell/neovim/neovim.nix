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
    /*home.file."./.config/nvim/jdtls_setup.lua" = {
      source = ./jdtls_setup.lua;
    };*/
    home.file."./.config/nvim/ftplugin/java.lua" = {
      source = let
        script = pkgs.writeText "ftplugin-java.lua" ''
          -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
          print(vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'))
          local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
          print(project_name)
          local workspace_dir = os.getenv('XDG_CACHE_HOME') .. '/jdtls/' .. project_name
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    'JAVA_OPTS=-Xmx1g ${pkgs.jdt-language-server}/bin/jdt-language-server',
    '-Dlog.protocol=true',
    '-data', workspace_dir
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
        '';
      in "${script}";
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
#        (writeShellScriptBin "jdtls" "exec ${jdt-language-server}/bin/jdt-language-server")
      ];
    };
  };
}
