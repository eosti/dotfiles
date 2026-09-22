-- Mason is used to manage LSP servers
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ansiblels",
		"astro",
		"bashls",
		"clangd",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"html",
		"jsonls",
		"ts_ls",
		"texlab",
		"lua_ls",
		"marksman",
		"ruff",
		"pyright",
		"tailwindcss",
		"yamlls",
		"jinja_lsp",
		"ty",
	},
	automatic_installation = true,
})

local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

-- Setup language servers
local lsps = {
	{ "clangd" },
	{ "eslint" },
	{ "astro" },
	{
		"ruff",
		{
			init_options = {
				settings = {
					configurationPreference = "filesystemFirst",
					linelength = 100,
				},
			},
		},
	},
	{
		"ty",
		{
			settings = {},
		},
		-- "pyright",
		-- {
		-- 	settings = {
		-- 		python = {
		-- 			analysis = {
		-- 				typeCheckingMode = "basic",
		-- 				autoImportCompletions = true,
		-- 			},
		-- 		},
		-- 	},
		-- },
	},
	{
		"lua_ls",
		{
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
	},
	{
		"bashls",
		{
			filetypes = { "bash", "sh", "zsh" },
		},
	},
	{
		"jinja_lsp",
		{
			filetypes = { "jinja", "jinja2", "j2" },
		},
	},
}

for _, lsp in pairs(lsps) do
	local name, config = lsp[1], lsp[2]
	vim.lsp.enable(name)
	if config then
		vim.lsp.config(name, config)
	end
end

vim.filetype.add({
	extension = {
		jinja = "jinja",
		jinja2 = "jinja",
		j2 = "jinja",
	},
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
-- This sets [d and ]d to open the float by default
vim.diagnostic.config({ jump = { float = true } })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client.name == "ruff" then
			-- Disable hover in favor of Pyright
			client.server_capabilities.hoverProvider = false
		end
	end,
	desc = "LSP: Disable hover capability from Ruff",
})
