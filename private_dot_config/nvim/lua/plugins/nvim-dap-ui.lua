return {
  "rcarriga/nvim-dap-ui",
  event = "BufWinEnter",
  dependencies = "mfussenegger/nvim-dap",
  enabled = vim.fn.has("win32") == 0,
  config = function()
    require("dapui").setup()
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
