local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  highlight = {
    enable = true;
  }
  indent = {
    enable = true;
  }
}

-- Highlight the @punctuation.bracket (curly brace) capture group with the highlight group ""
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
