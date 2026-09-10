return {
	--
	-- Appearance
	--

	{
		"f4z3r/gruvbox-material.nvim",
		name = "gruvbox-material",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("NeoSolarized").setup({
				style = "dark",
				transparent = "false",
			})
		end,
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},

	--
	-- LSP
	--

	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	"neovim/nvim-lspconfig",

	-- cmp

	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets", "disrupted/blink-cmp-conventional-commits" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		event = "VeryLazy",
	},

	-- nvim Tools
	"LudoPinelli/comment-box.nvim",
	"tpope/vim-repeat",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = { show_start = false, show_end = false },
			indent = { char = { "│" } },
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},

	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {}, -- tree-sitter CLI must be installed system-wide
		config = function()
			require("tree-sitter-manager").setup()
		end,
	},

	-- consider blink-pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},

	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			restricted_keys = {
				["j"] = {},
				["k"] = {},
			},
		},
	},
}
