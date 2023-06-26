return {
  "barrett-ruth/live-server.nvim",
  build = "yarn global add live-server",
  config = function()
    require("live_server").setup({})
  end,
}
