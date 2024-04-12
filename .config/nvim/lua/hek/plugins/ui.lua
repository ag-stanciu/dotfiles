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
        end,
        config = function()
            local util = require("hek.util")
            require("dressing").setup({
                input = {
                    relative = "win",
                    border = util.border_chars_outer_thin,
                    prefer_width = 60,
                }
            })
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
                        bg = colors.bg,
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
        'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = {
                char = '┊',
                highlight = "IndentBlanklineChar",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    'help',
                    'lazy',
                    'mason'
                }
            }
        },
    },
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "help", "alpha", "NvimTree", "neo-tree", "Trouble", "lazy", "mason" },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
            require("mini.indentscope").setup({
                -- symbol = "▏",
                symbol = "│",
                options = { try_as_border = true },
                draw = {
                    animation = require("mini.indentscope").gen_animation.none()
                }
            })
        end,
    },
    -- {
    --     "folke/noice.nvim",
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify"
    --     },
    --     event = "VeryLazy",
    --     opts = {
    --         notify = {
    --             enabled = false,
    --         },
    --         lsp = {
    --             progress = {
    --                 enabled = false
    --             },
    --             override = {
    --                 ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --                 ["vim.lsp.util.stylize_markdown"] = true,
    --             },
    --         },
    --         presets = {
    --             bottom_search = true,
    --             command_palette = true,
    --             long_message_to_split = true,
    --             inc_rename = true,
    --         },
    --     }
    -- },
    {
        "utilyre/barbecue.nvim",
        event = "VeryLazy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            local util = require("hek.util")
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
    }
}
