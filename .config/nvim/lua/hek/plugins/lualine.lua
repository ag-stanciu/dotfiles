return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            -- PERF: we don't need this lualine require madness
            local lualine_require = require("lualine_require")
            lualine_require.require = require

            vim.o.laststatus = vim.g.lualine_laststatus
            local util = require("hek.util")
            local colors = require("hek.color").colors
            local lsp_active = function()
                -- local names = {}
                for _, _ in pairs(vim.lsp.get_clients()) do
                    -- if server.name ~= "null-ls" then
                    --     table.insert(names, server.name)
                    -- end
                    -- return "♦"
                    return " "
                end
                -- return "  " .. table.concat(names, " ") .. " "
                -- return "  "
                return ""
            end
            -- local function diff_source()
            --     local gitsigns = vim.b.gitsigns_status_dict
            --     if gitsigns then
            --         return {
            --             added = gitsigns.added,
            --             modified = gitsigns.changed,
            --             removed = gitsigns.removed
            --         }
            --     end
            -- end

            local theme = require("lualine.themes.tokyonight-night")
            -- local theme = require("lualine.themes.poimandres")
            -- local theme = require("lualine.themes.kanagawa-paper")
            theme.normal.c.bg = 'none'
            theme.normal.b.bg = colors.bg_dark
            theme.insert.b.bg = colors.bg_dark
            theme.visual.b.bg = colors.bg_dark
            theme.command.b.bg = colors.bg_dark
            theme.replace.b.bg = colors.bg_dark
            theme.inactive.b.bg = colors.bg_dark

            local opts = {
                options = {
                    theme = theme,
                    globalstatus = vim.o.laststatus == 3,
                    component_separators = {
                        left = "",
                        right = "",
                    },
                    section_separators = {
                        left = util.powerline.triangle.right,
                        right = util.powerline.triangle.left,
                    },
                    disabled_filetypes = {
                        statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
                        winbar = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },

                    -- lualine_c = { { 'diff', source = diff_source }, },
                    lualine_c = {},
                    lualine_x = {
                        {
                            "diagnostics",
                            symbols = {
                                error = util.signs.Error,
                                warn = util.signs.Warn,
                                info = util.signs.Info,
                                hint = util.signs.Hint,
                            },
                        },
                        { lsp_active, padding = { left = 1, right = 0 }, color = { fg = colors.green1, bg = 'none' } },
                    },
                    lualine_y = {
                        { "filetype" },
                        { "location", padding = { left = 1, right = 1 } },
                    },
                    lualine_z = {
                        {
                            "progress",
                            separator = " ",
                            padding = { left = 1, right = 1 },
                            fmt = function(str)
                                return " " .. str
                            end
                        },
                    },
                },
                extensions = { "lazy", "fzf", "nvim-tree", "mason" },
            }

            return opts
        end,
    }
}
