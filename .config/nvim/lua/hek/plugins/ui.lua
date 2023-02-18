return {
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end
    },
    {
        'akinsho/nvim-bufferline.lua',
        event = "VeryLazy",
        config = function()
            local bufferline = require('bufferline')
            local colors = require("hek.color").colors
            -- Bufferine
            bufferline.setup {
                options = {
                    offsets = { { filetype = "NvimTree", text = "", separator = true, highlight = "Directory" } },
                    buffer_close_icon = "",
                    modified_icon = "",
                    close_icon = "",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    max_name_length = 14,
                    max_prefix_length = 13,
                    tab_size = 20,
                    show_tab_indicators = true,
                    enforce_regular_tabs = false,
                    view = "multiwindow",
                    show_buffer_close_icons = true,
                    separator_style = "thin",
                    -- mappings = true,
                    always_show_bufferline = true,
                },
                highlights = {
                    fill = {
                        bg = colors.bg
                    }
                }
            }

            vim.keymap.set("n", "<S-t>", ":enew<CR>", { silent = true })
            vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { silent = true })
            vim.keymap.set("n", "<S-x>", ":bd!<CR>", { silent = true })
            vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>", { silent = true })
            vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { silent = true })
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
        event = "BufReadPost",
        config = function()
            local blankline = require('indent_blankline')
            blankline.setup {
                char = '┊',
                filetype_exclude = { 'help, packer' },
                use_treesitter = true,
                buftype_exclude = { 'terminal', 'nofile' },
                char_highlight = 'LineNr',
                show_trailing_blankline_indent = false,
                -- show_end_of_line = true,
                space_char_blankline = ' ',
                -- show_current_context = true,
                -- show_first_indent_level = false,
            }
        end
    },
    -- {
    --     "utilyre/barbecue.nvim",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "SmiteshP/nvim-navic",
    --         "nvim-tree/nvim-web-devicons", -- optional dependency
    --     },
    --     config = function()
    --         local util = require("hek.util")
    --         require("barbecue").setup({
    --             create_autocmd = false, -- prevent barbecue from updating itself automatically
    --             kinds = util.kinds
    --         })
    --
    --         vim.api.nvim_create_autocmd({
    --             "WinResized", -- or WinResized on NVIM-v0.9 and higher
    --             "BufWinEnter",
    --             "CursorHold",
    --             "InsertLeave",
    --
    --             -- include these if you have set `show_modified` to `true`
    --             "BufWritePost",
    --             "TextChanged",
    --             "TextChangedI",
    --         }, {
    --             group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    --             callback = function()
    --                 require("barbecue.ui").update()
    --             end,
    --         })
    --     end,
    -- }
}
