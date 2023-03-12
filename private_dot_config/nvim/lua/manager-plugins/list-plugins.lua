return {
--depencies
 "nvim-lua/plenary.nvim",
 "nvim-tree/nvim-web-devicons",
 "MunifTanjim/nui.nvim",

{
 "EdenEast/nightfox.nvim", -- preferred colorscheme
	"catppuccin/nvim", as = "catppuccin", -- Using Packer
	"navarasu/onedark.nvim",
	"sainnhe/everforest",
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer", -- maximizes and restores current window
	"inkarkat/vim-ReplaceWithRegister",
},
--file folder
		"nvim-neo-tree/neo-tree.nvim", branch = "v2.x",
--cmp
  { "hrsh7th/nvim-cmp",
	  "hrsh7th/cmp-nvim-lsp",
  -- buffer completions
   "hrsh7th/cmp-buffer",
  -- path completions
   "hrsh7th/cmp-path",
  -- snippet completions
	 "saadparwaiz1/cmp_luasnip",
  -- command completions
   "hrsh7th/cmp-cmdline",
  -- spelling completions
   "f3fora/cmp-spell",
  -- helps Vimtex completions
   "hrsh7th/cmp-omni",
},
"EdenEast/nightfox.nvim", -- preferred colorscheme
	{ "catppuccin/nvim", as = "catppuccin" }, -- Using Packer
	"navarasu/onedark.nvim",
	"sainnhe/everforest",
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer", -- maximizes and restores current window
	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder
	{ "nvim-telescope/telescope-ui-select.nvim" }, -- for showing lsp code actions
	{ "ibhagwan/fzf-lua" },
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	"hrsh7th/cmp-vsnip",
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
	{
		"smjonas/inc-rename.nvim",
	},
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	"nvim-treesitter/nvim-treesitter-context",
	"HiPhish/nvim-ts-rainbow2",
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	{
		"akinsho/toggleterm.nvim",
	},
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"jay-babu/mason-nvim-dap.nvim",
	"mfussenegger/nvim-dap-python",
	"rcarriga/nvim-notify",
	"j-hui/fidget.nvim",
	"folke/todo-comments.nvim",
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"lukas-reineke/indent-blankline.nvim",
	"theHamsta/nvim-dap-virtual-text",
	{
		"mvllow/modes.nvim",
	},
	"folke/which-key.nvim", -- refer to the configuration section below
	"norcalli/nvim-colorizer.lua",
	"manzeloth/live-server",
	--	"ray-x/lsp_signature.nvim",
	"gpanders/editorconfig.nvim",
	{
		"phaazon/hop.nvim",
	},
	"rmagatti/alternate-toggler",
	"windwp/nvim-autopairs",
	"mg979/vim-visual-multi",
	"gcmt/wildfire.vim",
	"tpope/vim-surround",
	"MattesGroeger/vim-bookmarks",
	"tom-anders/telescope-vim-bookmarks.nvim",
	{ "kevinhwang91/nvim-hlslens" },
	"karb94/neoscroll.nvim",
	"numToStr/Comment.nvim",
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		-- integrate with lualine
		"nvim-lualine/lualine.nvim",
		event = { "VimEnter" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
		},
	},
	{ "axkirillov/easypick.nvim", dependencies = "nvim-telescope/telescope.nvim" },
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require("windows").setup()
		end,
	},
	-- Lua
	{
		"narutoxy/silicon.lua",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("silicon").setup({})
		end,
	},

	{
		"ray-x/navigator.lua",
		dependencies = {
			{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	},
	{
		"gelguy/wilder.nvim",
		config = function()
			-- config goes here
		end,
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	},
	'folke/tokyonight.nvim',
	'beauwilliams/focus.nvim',
	'glepnir/galaxyline.nvim',
}
