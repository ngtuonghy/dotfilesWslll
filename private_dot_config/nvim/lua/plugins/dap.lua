return {
  "mfussenegger/nvim-dap",
  event = "BufWinEnter",
  enabled = vim.fn.has("win32") == 0,
}
