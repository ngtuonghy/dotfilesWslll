-- auto install packer if not installed local ensure_packer = function()
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	---------------colorscheme
	use("EdenEast/nightfox.nvim") -- preferred colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" }) -- Using Packer
	use("navarasu/onedark.nvim")
	use("sainnhe/everforest")
	------------------------------------
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	-- Unless you are still migrating, remove the deprecated commands from v1.x
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
	use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions
	use({ "ibhagwan/fzf-lua" })
	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	--  use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use("hrsh7th/cmp-vsnip")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})
	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	--use('p00f/nvim-ts-rainbow')
	use("HiPhish/nvim-ts-rainbow2")
	-- auto closing
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	--terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	--dashboard
	--use('glepnir/dashboard-nvim')
	--debug
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("jay-babu/mason-nvim-dap.nvim")
	--use 'puremourning/vimspector'
	use("mfussenegger/nvim-dap-python")
	--now

	use({ "krivahtoo/silicon.nvim", run = "./install.sh" })

	use("rcarriga/nvim-notify")
	use("j-hui/fidget.nvim")
	use("folke/todo-comments.nvim")
	-- Packer
	use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})

	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use("lukas-reineke/indent-blankline.nvim")
	use("theHamsta/nvim-dap-virtual-text")

	use({
		"mvllow/modes.nvim",
		tag = "v0.2.0",
		config = function()
			require("modes").setup()
		end,
	})
	-- Lua
	use("folke/which-key.nvim") -- refer to the configuration section below
	use("norcalli/nvim-colorizer.lua")
	use("manzeloth/live-server")
	use("ray-x/lsp_signature.nvim")

	use("gpanders/editorconfig.nvim")
	use("sudoerwx/vim-ray-so-beautiful")

	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})
	-----text---------
	use("rmagatti/alternate-toggler")
	use("windwp/nvim-autopairs")
	use("mg979/vim-visual-multi")
	use("gcmt/wildfire.vim")
	use("tpope/vim-surround")
	----bookmark-------
	use("MattesGroeger/vim-bookmarks")
	use("tom-anders/telescope-vim-bookmarks.nvim")
	use({ "kevinhwang91/nvim-hlslens" })
	if packer_bootstrap then
		require("packer").sync()
	end
end)
