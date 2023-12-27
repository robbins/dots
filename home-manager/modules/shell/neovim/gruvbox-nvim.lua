require("gruvbox").setup({
	      contrast = "",
	      italic = {
    	        strings = false,
	      },
	      palette_overrides = {
	        bright_red = "#fb4934",
	        bright_blue = "#83a598",
		      bright_purple = "#d3869b",
        },
	    })
	    vim.o.background = "dark" -- or "light" for light mode
	    vim.cmd([[colorscheme gruvbox]])
