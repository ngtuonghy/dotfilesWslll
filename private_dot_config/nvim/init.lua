local use = require('utils').use

-- General configs
require('configs.options')
require('configs.keymaps')
require('configs.autocmds')
require('configs.commands')
require('configs.diagnostics')
require('configs.neovide')
--vim.api.nvim_command 'colorscheme onedark'
-- Lazy
require('utils.lazy')

local plugins = {
  use 'catppuccin',
  use 'onedark', --- catppuccin, tokyonight(night,storm,day,moon)
  use 'which-key',
  use 'neo-tree',
  use 'alpha',
  use 'telescope',
  use 'noice',
  use 'notify',
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
  use 'feline',
  use 'bufferline',
  use 'trouble',
  use 'nvim-surround',
  use 'fidget',
  use 'ChatGPT',
  use 'toggleterm',
  use 'nvim-ts-rainbow2',
  use 'beacon',
  use 'gitsigns',
  use 'neoscroll',
  use 'windows',
  use 'web-devicons',
  use 'modicator',
  use 'indent-blackline',
  use 'vim-ai',
  -- use 'copilot',
  use 'shot',
  use 'inc-rename',
  use 'lastplace',
  use 'nvim-colorizer',
  use 'undotree',
  use 'live-sever',
  use 'better-escapek',
  use 'lspsaga',
  use 'vim-matchup',
  use 'nvim-autorunner',
  -- use 'nvim-buildme',
  use 'project',
  -- use 'winshift',
  use 'animation',
  use 'focus',
  use 'nvim-window',
  use 'bufdelete',
  --use 'omnisharp',

}
require('lazy').setup({
  spec = plugins,
  install = {
    colorscheme = { 'onedark' },
  },
})
vim.cmd.source('~/.config/nvim/config.vim')
