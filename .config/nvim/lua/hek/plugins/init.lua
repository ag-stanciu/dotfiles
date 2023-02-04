return {
    -- Colorschemes
    'folke/tokyonight.nvim',
    -- 'olimorris/onedark.nvim'
    -- 'EdenEast/nightfox.nvim'
    -- 'rmehri01/onenord.nvim',
    -- "rebelot/kanagawa.nvim"
    -- 'kvrohit/substrata.nvim'
    -- 'kvrohit/rasmus.nvim'
    -- 'sainnhe/gruvbox-material'
    -- 'kaiuri/nvim-juliana'
    -- 'olivercederborg/poimandres.nvim',

    -- LSP
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    'jose-elias-alvarez/null-ls.nvim',
    'jose-elias-alvarez/typescript.nvim',
    'b0o/schemastore.nvim',
    'folke/neodev.nvim',
    {
        'j-hui/fidget.nvim',
        event = "VeryLazy",
        config = function ()
           require("fidget").setup({
                text = {
                    spinner = "dots"
                }
            })
        end
    },

    -- UI
    {
        'karb94/neoscroll.nvim',
        event = "VeryLazy",
        config = function ()
           require("neoscroll").setup()
        end
    },

    -- Misc
    {
        'norcalli/nvim-colorizer.lua',
        event = "BufReadPost",
        config = function ()
            require("colorizer").setup()
        end
    },
    {
        'kylechui/nvim-surround',
        event = "VeryLazy",
        config = function ()
           require("nvim-surround").setup()
        end
    },

    {
        'akinsho/git-conflict.nvim',
        event = "BufReadPost",
        version = "*" ,
        config = function ()
           require("git-conflict").setup()
        end
    },
}
