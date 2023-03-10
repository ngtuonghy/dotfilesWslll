-- setup must be called before loading
--vim.cmd("colorscheme nightfox")
--vim.g.catppuccin_diagnostic_line_highlight = 1
--vim.cmd('colorscheme everforest')
local colorscheme = "catppuccin"
-- vim.cmd("colorscheme onedark")
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
