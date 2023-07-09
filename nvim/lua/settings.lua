-- Line numbering
vim.opt.number = true           -- Always show line numbers
vim.opt.relativenumber = true   -- Use relative line numbers
vim.opt.cursorline = true       -- Highlight current line

-- Indentation, spacing
vim.opt.smartindent = true  -- Autoindent, but context-aware
vim.opt.expandtab = true    -- Replace tabs with spaces
vim.opt.tabstop = 4         -- Tabs are 4 spaces
vim.opt.softtabstop = 4     -- Tab key indents by 4 spaces
vim.opt.shiftwidth = 4      -- >> indents by 4 spaces
vim.opt.shiftround = true   -- >> indents to next multiple of shiftwidth

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true    -- If there are any capital letters, assume case-sensitive
vim.opt.wrapscan = true     -- If we reach the end, wrap to beginning

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Display
vim.opt.wrap = true             -- Wrap lines if they get too long
vim.opt.linebreak = true        -- Linebreak between words
vim.opt.display = "lastline"    -- Show as much as possible of the last line
vim.opt.synmaxcol = 0           -- Syntax highlight entire line regardless of length
vim.opt.showmode = true         -- Show mode in statusline
vim.opt.report = 0              -- Always report changed lines (ex. for yanking)
vim.opt.mouse = 'a'             -- Mouse enabled in all modes
vim.opt.termguicolors = true    -- Color compatibility
vim.opt.conceallevel = 0        -- Stop hiding things and making me go crazy
vim.opt.list = true             -- Show non-printable characters
-- Chooses what invisible characters to show (specifically, don't show trailing spaces or eols)
vim.opt.listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'

if vim.loop.os_uname().sysname == "Darwin" then
    vim.cmd([[colorscheme gruvbox-material]])
else
    vim.cmd([[colorscheme NeoSolarized]])
end

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
