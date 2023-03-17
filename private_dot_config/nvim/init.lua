local use = require('utils').use

-- General configs
require('configs.options')
require('configs.keymaps')
require('configs.autocmds')
require('configs.commands')
require('configs.diagnostics')
require('configs.neovide')

-- Lazy
require('utils.lazy')

local plugins = {
 -- use 'catppuccin',
  use 'onedark', --- catppuccin, tokyonight(night,storm,day,moon)
  use 'which-key',
  use 'neo-tree',
  use 'alpha',
  use 'telescope',
  use 'noice-notify',
  use 'treesitter',
  use 'lsp',
  use 'mason',
  use 'cmp',
  use 'luasnip',
  use 'hop',
  use 'autopairs',
  use 'windows',
  use 'yanky',
  use 'null-ls',
  use 'Comment',
  use 'dap',
  use 'dap-ui',

}
require('lazy').setup({
  spec = plugins,
  install = {
    colorscheme = { 'onedark' },
  },
})

vim.cmd.source('~/.config/nvim/config.vim')
