local M = {}

M.load = function()
    -- colors
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup({
        style = "night",
        plugins = {
            auto = true,
        },
        transparent = true,
        lualine_bold = true,
        styles = {
            -- floats = "transparent"
        },
        on_highlights = function(hl, c)
            -- Normals.
            hl.TelescopePromptNormal = { bg = c.bg, }
            hl.TelescopeResultsNormal = { bg = c.bg_dark, }
            hl.TelescopePreviewNormal = { bg = c.bg_dark, }

            --     -- Selection.
            hl.TelescopeSelection = { bg = c.bg_highlight, fg = c.fg, bold = true, }
            hl.TelescopeSelectionCaret = { fg = c.blue7, bg = c.bg_highlight, bold = true }

            -- Titles.
            hl.TelescopePreviewTitle = { bg = c.blue7, fg = c.black, bold = true, }
            hl.TelescopeResultsTitle = { bg = c.blue7, fg = c.black, bold = true, }
            hl.TelescopePromptTitle = { bg = c.blue7, fg = c.black, bold = true, }
            hl.TelescopeTitle = { bg = c.orange, fg = c.black, bold = true, }

            -- Borders.
            -- hl.TelescopeBorder = { fg = c.fg, bg = c.bg_popup, }
            hl.TelescopePromptBorder = { bg = c.bg, fg = c.blue7, }
            hl.TelescopeResultsBorder = { bg = c.bg_dark, fg = c.blue7, }
            hl.TelescopePreviewBorder = { bg = c.bg_dark, fg = c.blue7, }

            -- Misc.
            hl.TelescopePromptPrefix = { bg = c.bg, fg = c.blue7, }

            hl.PopupNormal = { bg = c.bg_dark, }
            hl.PopupBorder = { bg = c.bg_dark, fg = c.blue7, }
            hl.NormalFloat = { bg = c.bg_dark, }
            hl.FloatBorder = { bg = c.bg_dark, fg = c.blue7 }
            --
            hl.Pmenu = { link = 'PopupNormal' }
            hl.PmenuSel = { bg = c.blue7 }
            hl.PmenuBorder = { link = 'PopupBorder' }
            hl.PmenuDocBorder = { bg = c.bg_dark, fg = c.blue7 }
            --
            -- hl.CmpItemAbbrDeprecated = { fg = c.comment, bg = "NONE", strikethrough = true }
            -- hl.CmpItemAbbrMatch = { fg = c.blue, bg = "NONE", bold = true }
            -- hl.CmpItemAbbrMatchFuzzy = { fg = c.blue, bg = "NONE", bold = true }
            -- hl.CmpItemMenu = { fg = c.purple, bg = "NONE", italic = true }
            --
            -- hl.CmpItemKindField = { fg = c.fg, bg = c.red }
            -- hl.CmpItemKindProperty = { fg = c.fg, bg = c.red }
            -- hl.CmpItemKindEvent = { fg = c.fg, bg = c.red }
            --
            -- hl.CmpItemKindText = { fg = c.fg, bg = c.green2 }
            -- hl.CmpItemKindEnum = { fg = c.fg, bg = c.green2 }
            -- hl.CmpItemKindKeyword = { fg = c.fg, bg = c.green2 }
            --
            -- hl.CmpItemKindConstant = { fg = c.fg, bg = c.magenta2 }
            -- hl.CmpItemKindConstructor = { fg = c.fg, bg = c.magenta2 }
            -- hl.CmpItemKindReference = { fg = c.fg, bg = c.magenta2 }
            --
            -- hl.CmpItemKindFunction = { fg = c.fg, bg = c.purple }
            -- hl.CmpItemKindStruct = { fg = c.fg, bg = c.purple }
            -- hl.CmpItemKindClass = { fg = c.fg, bg = c.purple }
            -- hl.CmpItemKindModule = { fg = c.fg, bg = c.purple }
            -- hl.CmpItemKindOperator = { fg = c.fg, bg = c.purple }
            --
            -- hl.CmpItemKindVariable = { fg = c.fg_dark, bg = c.dark3 }
            -- hl.CmpItemKindFile = { fg = c.fg_dark, bg = c.dark3 }
            --
            -- hl.CmpItemKindUnit = { fg = c.fg, bg = c.yellow }
            -- hl.CmpItemKindSnippet = { fg = c.fg, bg = c.yellow }
            -- hl.CmpItemKindFolder = { fg = c.fg, bg = c.yellow }
            --
            -- hl.CmpItemKindMethod = { fg = c.fg, bg = c.blue }
            -- hl.CmpItemKindValue = { fg = c.fg, bg = c.blue }
            -- hl.CmpItemKindEnumMember = { fg = c.fg, bg = c.blue }
            --
            -- hl.CmpItemKindInterface = { fg = c.fg, bg = c.blue2 }
            -- hl.CmpItemKindColor = { fg = c.fg, bg = c.blue2 }
            -- hl.CmpItemKindTypeParameter = { fg = c.fg, bg = c.blue2 }
        end,
    })
    local colorscheme = require("tokyonight.colors").setup()
    -- local util = require("tokyonight.util")
    -- local grey9 = util.darken(colorscheme.bg_highlight, 0.5)
    -- local dark_red = util.darken(colorscheme.red, 0.5)
    vim.cmd("colorscheme tokyonight")

    local colors = vim.tbl_deep_extend("force", colorscheme, {
        statusline_bg = colorscheme.bg_statusline,
        statusline_div = colorscheme.bg_statusline,
        statusline_text = colorscheme.fg,
        grey9 = colorscheme.bg_highlight,
        dark_red = colorscheme.red,
        -- bg_dark = "#2e3440",
        -- gray = colorscheme.terminal_black,
    })

    return colors
end

return M
