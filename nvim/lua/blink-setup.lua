require("blink.cmp").setup({

	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	-- 'super-tab' for mappings similar to vscode (tab to accept)
	-- 'enter' for enter to accept
	-- 'none' for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		preset = "super-tab",
		["<CR>"] = { "select_and_accept", "fallback" },
		["<C-e>"] = { "cancel", "fallback" },
	},

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- (Default) Only show the documentation popup when manually triggered
	completion = { documentation = { auto_show = false } },

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "conventional_commits" },

		providers = {
			conventional_commits = {
				name = "Conventional Commits",
				module = "blink-cmp-conventional-commits",
				enabled = function()
					return vim.bo.filetype == "gitcommit"
				end,
				opts = {
					-- See https://github.com/disrupted/blink-cmp-conventional-commits#options
				},
			},
			cmdline = {
				min_keyword_length = function(ctx)
					-- when typing a command, only show when the keyword is 3 characters or longer
					if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
						return 3
					end
					return 0
				end,
			},
		},
	},

	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept", "fallback" },
		},

		completion = {
			menu = { auto_show = true },
			list = { selection = { preselect = false } },
		},

		sources = function()
			local type = vim.fn.getcmdtype()
			-- search
			if type == "/" or type == "?" then
				return { "buffer" }
			end
			if type == ":" then
				return { "cmdline", "path" }
			end
			return {}
		end,
	},
	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "prefer_rust_with_warning" },

	signature = { enabled = true },
})
