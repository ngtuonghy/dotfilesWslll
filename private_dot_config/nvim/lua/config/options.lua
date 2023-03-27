-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
---------------------
vim.keymap.set("i", "jk", "<ESC>")
-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")