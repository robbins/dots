local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Highlight the @punctuation.bracket (curly brace) capture group with the highlight group ""
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
