local M = {}

M.load = function()
    -- everforest
    require("everforest").setup({
        background = "hard",
        transparent_background_level = 2,
        float_style = "dim",
        on_highlights = function(hl, palette)
            hl.TelescopePromptNormal = { bg = palette.bg, }
            hl.TelescopeResultsNormal = { bg = palette.bg, }
            hl.TelescopePreviewNormal = { bg = palette.bg, }

            --     -- Selection.
            hl.TelescopeSelection = { bg = palette.bg1, fg = palette.fg, bold = true, }
            hl.TelescopeSelectionCaret = { fg = palette.blue7, bg = palette.bg1, bold = true }

            --     -- Titles.
            hl.TelescopePreviewTitle = { bg = palette.blue, fg = palette.bg1, bold = true, }
            hl.TelescopeResultsTitle = { bg = palette.blue, fg = palette.bg1, bold = true, }
            hl.TelescopePromptTitle = { bg = palette.blue, fg = palette.bg1, bold = true, }
            hl.TelescopeTitle = { bg = palette.orange, fg = palette.bg1, bold = true, }

            -- Borders.
            -- hl.TelescopeBorder = { fg = palette.bg_popup, bg = palette.bg_popup, }
            hl.TelescopePromptBorder = { bg = palette.bg, fg = palette.blue, }
            hl.TelescopeResultsBorder = { bg = palette.bg_dark, fg = palette.blue, }
            hl.TelescopePreviewBorder = { bg = palette.bg_dark, fg = palette.blue, }

            -- Mispalette.
            hl.TelescopePromptPrefix = { bg = palette.bg, fg = palette.blue7, }

            hl.PopupNormal = { bg = palette.bg_dark, }
            hl.PopupBorder = { bg = palette.bg_dark, fg = palette.blue7, }
            hl.NormalFloat = { bg = palette.bg_dark, }
            hl.FloatBorder = { bg = palette.bg_dark, fg = palette.blue7 }

            hl.Pmenu = { link = 'PopupNormal' }
            hl.PmenuSel = { bg = palette.blue }
            hl.PmenuBorder = { link = 'PopupBorder' }
            hl.PmenuDocBorder = { bg = palette.bg, fg = palette.blue }


            hl.CmpItemAbbrDeprecated = { fg = palette.comment, bg = "NONE", strikethrough = true }
            hl.CmpItemAbbrMatch = { fg = palette.blue, bg = "NONE", bold = true }
            hl.CmpItemAbbrMatchFuzzy = { fg = palette.blue, bg = "NONE", bold = true }
            hl.CmpItemMenu = { fg = palette.purple, bg = "NONE", italic = true }

            hl.CmpItemKindField = { fg = palette.fg, bg = palette.red }
            hl.CmpItemKindProperty = { fg = palette.fg, bg = palette.red }
            hl.CmpItemKindEvent = { fg = palette.fg, bg = palette.red }

            hl.CmpItemKindText = { fg = palette.fg, bg = palette.green }
            hl.CmpItemKindEnum = { fg = palette.fg, bg = palette.green }
            hl.CmpItemKindKeyword = { fg = palette.fg, bg = palette.green }

            hl.CmpItemKindConstant = { fg = palette.fg, bg = palette.magenta }
            hl.CmpItemKindConstructor = { fg = palette.fg, bg = palette.magenta }
            hl.CmpItemKindReference = { fg = palette.fg, bg = palette.magenta }

            hl.CmpItemKindFunction = { fg = palette.fg, bg = palette.purple }
            hl.CmpItemKindStruct = { fg = palette.fg, bg = palette.purple }
            hl.CmpItemKindClass = { fg = palette.fg, bg = palette.purple }
            hl.CmpItemKindModule = { fg = palette.fg, bg = palette.purple }
            hl.CmpItemKindOperator = { fg = palette.fg, bg = palette.purple }

            hl.CmpItemKindVariable = { fg = palette.fg_dark, bg = palette.dark3 }
            hl.CmpItemKindFile = { fg = palette.fg_dark, bg = palette.dark3 }

            hl.CmpItemKindUnit = { fg = palette.fg, bg = palette.yellow }
            hl.CmpItemKindSnippet = { fg = palette.fg, bg = palette.yellow }
            hl.CmpItemKindFolder = { fg = palette.fg, bg = palette.yellow }

            hl.CmpItemKindMethod = { fg = palette.fg, bg = palette.blue }
            hl.CmpItemKindValue = { fg = palette.fg, bg = palette.blue }
            hl.CmpItemKindEnumMember = { fg = palette.fg, bg = palette.blue }

            hl.CmpItemKindInterface = { fg = palette.fg, bg = palette.blue }
            hl.CmpItemKindColor = { fg = palette.fg, bg = palette.blue }
            hl.CmpItemKindTypeParameter = { fg = palette.fg, bg = palette.blue }
        end,
    })
    vim.cmd("colorscheme everforest")
    local conf = require("everforest").config
    local colorscheme = require("everforest.colours").generate_palette(conf, "dark")
    -- vim.print(vim.inspect(colorscheme))
    local colors = vim.tbl_deep_extend("force", colorscheme, {
        -- bg = colorscheme.bg0,
        statusline_bg = colorscheme.bg,
        statusline_div = colorscheme.bg,
        statusline_text = colorscheme.fg,
        grey9 = colorscheme.grey0,
        dark_red = colorscheme.red1,
        bg_dark = colorscheme.bg0,
        -- gray = colorscheme.terminal_black,
    })

    return colors
end

return M
