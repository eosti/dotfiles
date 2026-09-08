require("tree-sitter-manager").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"python",
		"bash",
		"cpp",
		"diff",
		"dockerfile",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"latex",
		"markdown_inline",
		"toml",
		"yaml",
		"astro",
		"javascript",
		"html",
		"css",
	},

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = true,
})
