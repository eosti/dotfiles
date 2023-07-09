-- Install packer.nvim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    --
    -- Appearance
    --

    use 'sainnhe/gruvbox-material'

    use {
        'Tsuzat/NeoSolarized.nvim',
        config = function()
            require('NeoSolarized').setup {
                style = "dark",
                transparent = "false",
            }
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --
    -- LSP
    --

    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }

    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

    -- cmp

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            use 'hrsh7th/cmp-nvim-lsp',
            use 'hrsh7th/cmp-buffer',
            use 'hrsh7th/cmp-path',
            use 'hrsh7th/cmp-cmdline',
            use 'dcampos/cmp-snippy',
            use "onsails/lspkind.nvim",
        }
    }

    -- snippy
    use 'dcampos/nvim-snippy'
    use 'honza/vim-snippets'

    -- nvim Tools
    use 'LudoPinelli/comment-box.nvim'
    use 'tpope/vim-repeat'
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = false,
                use_treesitter = true,
            }
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        "windwp/nvim-autopairs",
        config = function() 
            require("nvim-autopairs").setup {
                -- Needs special config to use with cmp
            } 
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

