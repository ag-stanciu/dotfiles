local util = require("hek.util")
return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            indent = {
                enabled = true,
                animate = {
                    enabled = false,
                },
                indent = {
                    char = '┊',
                }
            },
            input = { enabled = true },
            statuscolumn = { enabled = true },
            scroll = { enabled = true },
            picker = {
                win = {
                    input = {
                        keys = {
                            ["<Esc>"] = { "close", mode = { "n", "i" } },
                            ["<Tab>"] = { "list_up", mode = { "n", "i" } },
                            ["<S-Tab>"] = { "list_down", mode = { "n", "i" } },
                            ["<c-a>"] = { "select_and_prev", mode = { "n", "i" } },
                        }
                    }
                },
                layout = {
                    reverse = true,
                    layout = {
                        box = "horizontal",
                        backdrop = false,
                        width = 0.75,
                        height = 0.85,
                        border = "none",
                        {
                            box = "vertical",
                            { win = "list",  title = " Results ", title_pos = "center", border = util.border_chars_outer_thin },
                            { win = "input", height = 1, border = util.border_chars_outer_thin, title = "{source} {live}", title_pos = "center" },
                        },
                        {
                            win = "preview",
                            width = 0.45,
                            -- border = "rounded",
                            border = util.border_chars_outer_thin,
                            title = " Preview ",
                            title_pos = "center",
                        },
                    },
                }
            },
        },
        keys = {
            { "<leader><space>", function() Snacks.picker.buffers() end },
            { "<leader>ff",      function() Snacks.picker.files() end },
            { "<leader>fb",      function() Snacks.picker.buffers() end },
            { "<leader>fh",      function() Snacks.picker.help() end },
            { "<leader>fs",      function() Snacks.picker.grep_word() end },
            { "<leader>fw",      function() Snacks.picker.grep() end },
            { "<leader>?",       function() Snacks.picker.recent() end },
            { "<leader>gt",      function() Snacks.picker.git_status() end },
            { "<leader>fr",      function() Snacks.picker.lsp_references() end },
            { "<leader>sr",      function() Snacks.picker.resume() end },
        }
    },
    {
        'akinsho/nvim-bufferline.lua',
        event = "VeryLazy",
        config = function()
            local bufferline = require('bufferline')
            -- local colors = require("hek.color").colors
            -- Bufferine
            bufferline.setup {
                options = {
                    offsets = { { filetype = "NvimTree", text = "", separator = true, highlight = "Directory" },
                        { filetype = "neo-tree", text = "NeoTree", separator = false, text_align = "left" } },
                    buffer_close_icon = "󰅖",
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
                    always_show_bufferline = false,
                },
                highlights = {
                    fill = {
                        -- bg = colors.bg,
                        bg = "none"
                    },
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
        -- "utilyre/barbecue.nvim",
        "mbwilding/barbecue.nvim",
        event = "VeryLazy",
        dependencies = {
            "SmiteshP/nvim-navic",
            -- "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            -- local util = require("hek.util")
            require("barbecue").setup({
                create_autocmd = false, -- prevent barbecue from updating itself automatically
                kinds = util.new_kinds,
                -- symbols = {
                --     separator = ">",
                -- }
            })

            vim.api.nvim_create_autocmd({
                "WinResized", -- or WinResized on NVIM-v0.9 and higher
                "BufWinEnter",
                "CursorHold",
                "InsertLeave",

                -- include these if you have set `show_modified` to `true`
                "BufWritePost",
                "TextChanged",
                "TextChangedI",
            }, {
                group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                callback = function()
                    require("barbecue.ui").update()
                end,
            })
        end,
    },
    -- {
    --     'folke/todo-comments.nvim',
    --     event = 'VimEnter',
    --     dependencies = { 'nvim-lua/plenary.nvim' },
    --     opts = { signs = false }
    -- }
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = function()
            require("colorizer").setup()
        end
    },
}
