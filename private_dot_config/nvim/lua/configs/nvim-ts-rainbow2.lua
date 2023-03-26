return {
  'HiPhish/nvim-ts-rainbow2',
  config = function()
    require("nvim-treesitter.configs").setup {
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = { "jsx" },
        -- Which query to use for finding delimiters
        query = 'rainbow-parens',
        -- Highlight the entire buffer all at once
        strategy = require 'ts-rainbow.strategy.global',
      },
    }
  end,
}
