return {
    -- Colorschemes
    {
        'folke/tokyonight.nvim',
        lazy = true,
    },
    -- {
    --     "rmehri01/onenord.nvim",
    --     lazy = true,
    -- },
    -- 'olimorris/onedark.nvim'
    -- 'EdenEast/nightfox.nvim'
    -- 'rmehri01/onenord.nvim',
    -- "rebelot/kanagawa.nvim"
    -- 'kvrohit/substrata.nvim'
    -- 'kvrohit/rasmus.nvim'
    -- 'sainnhe/gruvbox-material'
    -- 'kaiuri/nvim-juliana'
    -- 'olivercederborg/poimandres.nvim',

    {
        'j-hui/fidget.nvim',
        event = "VeryLazy",
        opts = {
            text = {
                spinner = "dots",
                done = "",
            },
        },
    },

    -- UI
    {
        'karb94/neoscroll.nvim',
        event = "VeryLazy",
        config = function()
            require("neoscroll").setup()
        end
    },

    -- Misc
    {
        'norcalli/nvim-colorizer.lua',
        event = "BufReadPost",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        'kylechui/nvim-surround',
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },

    {
        'akinsho/git-conflict.nvim',
        event = "BufReadPost",
        version = "*",
        config = function()
            require("git-conflict").setup()
        end
    },
    {
        'luukvbaal/statuscol.nvim',
        event = "VeryLazy",
        opts = {
            setopt = true,
        }
    },
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        opts = {
            input_buffer_type = "dressing"
        }
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        keys = {
            { "<leader>dx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
            { "<leader>wx", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        },
    },
}
