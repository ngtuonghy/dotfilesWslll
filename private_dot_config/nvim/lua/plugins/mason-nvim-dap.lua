return {
  "jay-babu/mason-nvim-dap.nvim",
  event = "BufWinEnter",
  dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
  enabled = vim.fn.has("win32") == 0,
  config = function()
    local mason_nvim_dap = require("mason-nvim-dap")
    mason_nvim_dap.setup({ automatic_setup = true })
    --    mason_nvim_dap.setup_handlers({})
  end,
}
