-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
---------------------

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts) -- caused conflict with WhichKey
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.mapleader = " "
---------------------
-- General Keymaps
---------------------
vim.keymap.set("i", "jk", "<ESC>")
-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

vim.keymap.set("n", "<C-o>", "<cmd>:BufferLineCycleNext<cr>")
vim.keymap.set("n", "<C-i>", "<cmd>:BufferLineCyclePrev<cr>")

vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<cr>") -- make the window biger vertically
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<cr>") -- make the window smaller vertically
vim.keymap.set("n", "<C-Up>", "<cmd>horizontal resize +2<cr>") -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "<C-Down>", "<cmd>horizontal resize -2<cr>") --