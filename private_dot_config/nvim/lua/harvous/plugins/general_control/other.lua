require("neoscroll").setup({ -- All these keys will be mapped to their corresponding default scrolling animation
	mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function = nil, -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
})

require("Comment").setup()

require("navigator").setup({
	mason = true,
})
require("inc_rename").setup({
	cmd_name = "IncRename", -- the name of the command
	hl_group = "Substitute", -- the highlight group used for highlighting the identifier's new name
	preview_empty_name = false, -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
	show_message = true, -- whether to display a `Renamed m instances in n files` message after a rename operation
	input_buffer_type = nil, -- the type of the external input buffer to use (the only supported value is currently "dressing")
	post_hook = nil, -- callback to run after renaming, receives the result table (from LSP handler) as an argument
})
