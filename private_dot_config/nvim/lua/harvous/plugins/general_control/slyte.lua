require("todo-comments").setup()

-- require("transparent").setup({
--   enable = true, -- boolean: enable transparent
--   extra_groups = { -- table/string: additional groups that should be cleared
--     "Comment"
--   },
--   exclude = {}, -- table: groups you don't want to clear
-- })
--
require("noice").setup({
	--	presets = { inc_rename = true },
	messages = {
		enable = true,
	},
})
require("notify").setup({
	background_colour = "#000000",
	render = "minimal",
})
