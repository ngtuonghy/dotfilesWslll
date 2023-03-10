--plugin manager--
require("harvous.plugins-setup")
require("harvous.list-plugins")
require("harvous.plugins.mason")
--core--
require("harvous.core.options")
require("harvous.core.keymaps")
require("harvous.core.colorscheme")
require("harvous.core.autocmd")
--general and control
require("harvous.plugins.general_control.slyte")
require("harvous.plugins.general_control.other")
--syntax
require("harvous.plugins.syntax.autopairs")
require("harvous.plugins.syntax.rainbow2")
require("harvous.plugins.syntax.colorizer")
require("harvous.plugins.syntax.modes")
--file and search
require("harvous.plugins.files_search.telescope")
require("harvous.plugins.files_search.neo-tree")
require("harvous.plugins.files_search.telescope-pickers")
--git
require("harvous.plugins.git.gitsigns")

require("harvous.plugins.lualine")
require("harvous.plugins.nvim-cmp")

require("harvous.plugins.lsp.mason-nvim-dap")
require("harvous.plugins.lsp.lspconfig")
--require("harvous.plugins.lsp.lsp_signature")
require("harvous.plugins.lsp.null-ls")

require("harvous.plugins.treesitter")
require("harvous.plugins.toggleterm")
require("harvous.plugins.dap")
--require("harvous.plugins.dapui")

require("harvous.plugins.bufferline")
require("harvous.plugins.alpha-nvim")
require("harvous.plugins.indent-blankline")
require("harvous.plugins.nvim-hop")
require("harvous.plugins.nvim-hlslens")
require("harvous.plugins.bookmark")

require("harvous.plugins.which-key")
