return {
    -- Colorschemes
    {
        'folke/tokyonight.nvim',
        lazy = true,
    },
    {
        "rmehri01/onenord.nvim",
        lazy = true,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
    },
    {
        "neanias/everforest-nvim",
        lazy = true,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = true,
    },
    -- 'olimorris/onedark.nvim'
    -- 'EdenEast/nightfox.nvim'
    -- 'rmehri01/onenord.nvim',
    -- "rebelot/kanagawa.nvim"
    -- 'kvrohit/substrata.nvim'
    -- 'kvrohit/rasmus.nvim'
    -- 'sainnhe/gruvbox-material'
    -- 'kaiuri/nvim-juliana'
    -- 'olivercederborg/poimandres.nvim',


    -- UI
    {
        "j-hui/fidget.nvim",
        config =  function ()
           require("fidget").setup()
        end
    },

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
        opts = true
    },
    {
        'luukvbaal/statuscol.nvim',
        event = "VeryLazy",
        config = true,
    },
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        opts = {
            input_buffer_type = "dressing"
        }
    },
    -- {
    --     "folke/trouble.nvim",
    --     cmd = { "TroubleToggle", "Trouble" },
    --     opts = { use_diagnostic_signs = true },
    --     keys = {
    --         { "<leader>dx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
    --         { "<leader>wx", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    --     },
    -- },
}
