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
      v = "neovim";
    };
    programs.nixvim = {
      enable = true;
      vimAlias = true;
      colorschemes.gruvbox.enable = true;
      plugins = {
        clangd-extensions.enable = true;
	lsp = {
	  enable = true;
	  servers = {
	    clangd.enable = true;
	    rnix-lsp.enable = true;
	  };
          keymaps.lspBuf = {
            K = "hover";
            gd = "definition";
          };
	};
	lspkind.enable = true;
	neo-tree.enable = true;
	nix.enable = true;
	nvim-autopairs.enable = true;
	nvim-cmp.enable = true;
	telescope.enable = true;
	todo-comments.enable = true;
	treesitter.enable = true;
	cmp_luasnip.enable = true;
	cmp-treesitter.enable = true;
      };
    };
  };
}
