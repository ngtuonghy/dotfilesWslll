-- Packer
return {
  "folke/noice.nvim",
    config = function()
   require("noice").setup({
		 presets = { inc_rename = true },
	     messages = {
		 enable = true,
	},
})
require("notify").setup({
	background_colour = "#000000",
	render = "minimal",
})
end
}
