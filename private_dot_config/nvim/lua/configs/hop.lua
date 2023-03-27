return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    local keymap = vim.keymap
    local hop = require("hop")
    hop.setup({
      case_insensitive = true,
      char2_fallback_key = "<CR>",
      quit_key = "<SPC>",
    })

    keymap.set({ "n", "v", "o" }, "f", "", {
      silent = true,
      noremap = true,
      callback = function()
        hop.hint_char2()
      end,
      desc = "nvim-hop char2",
    })
  end,
}
