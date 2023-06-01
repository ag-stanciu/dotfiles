local ok, tokyo = pcall(require, 'tokyonight')
if not ok then
    return
end

local M = {}

-- colors
tokyo.setup({
    style = "night",
    -- transparent = true,
    styles = {
        floats = "transparent"
    },
    on_highlights = function(hl, c)
        -- Normals.
        hl.TelescopePromptNormal = { bg = c.bg, }
        hl.TelescopeResultsNormal = { bg = c.bg_dark, }
        hl.TelescopePreviewNormal = { bg = c.bg_dark, }

        --     -- Selection.
        hl.TelescopeSelection = { bg = c.bg_highlight, fg = c.fg, bold = true, }
        hl.TelescopeSelectionCaret = { fg = c.blue7, bg = c.bg_highlight, bold = true }

        --     -- Titles.
        hl.TelescopePreviewTitle = { bg = c.blue7, fg = c.black, bold = true, }
        hl.TelescopeResultsTitle = { bg = c.blue7, fg = c.black, bold = true, }
        hl.TelescopePromptTitle = { bg = c.blue7, fg = c.black, bold = true, }
        hl.TelescopeTitle = { bg = c.orange, fg = c.black, bold = true, }

        -- Borders.
        -- hl.TelescopeBorder = { fg = c.bg_popup, bg = c.bg_popup, }
        hl.TelescopePromptBorder = { bg = c.bg, fg = c.blue7, }
        hl.TelescopeResultsBorder = { bg = c.bg_dark, fg = c.blue7, }
        hl.TelescopePreviewBorder = { bg = c.bg_dark, fg = c.blue7, }

        -- Misc.
        hl.TelescopePromptPrefix = { bg = c.bg, fg = c.blue7, }

        hl.PopupNormal = { bg = c.bg_dark, }
        hl.PopupBorder = { bg = c.bg_dark, fg = c.blue7, }
        hl.NormalFloat = { bg = c.bg_dark, }
        hl.FloatBorder = { bg = c.bg_dark, fg = c.blue7 }

        hl.Pmenu = { link = 'PopupNormal' }
        hl.PmenuSel = { bg = c.blue7 }
        hl.PmenuBorder = { link = 'PopupBorder' }
        hl.PmenuDocBorder = { bg = c.bg_dark, fg = c.blue7 }

        hl.CmpItemAbbrDeprecated = { fg = c.comment, bg = "NONE", strikethrough = true }
        hl.CmpItemAbbrMatch = { fg = c.blue, bg = "NONE", bold = true }
        hl.CmpItemAbbrMatchFuzzy = { fg = c.blue, bg = "NONE", bold = true }
        hl.CmpItemMenu = { fg = c.purple, bg = "NONE", italic = true }

        hl.CmpItemKindField = { fg = c.fg, bg = c.red }
        hl.CmpItemKindProperty = { fg = c.fg, bg = c.red }
        hl.CmpItemKindEvent = { fg = c.fg, bg = c.red }
        -- hl.CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" }
        -- hl.CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" }
        -- hl.CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" }

        hl.CmpItemKindText = { fg = c.fg, bg = c.green2 }
        hl.CmpItemKindEnum = { fg = c.fg, bg = c.green2 }
        hl.CmpItemKindKeyword = { fg = c.fg, bg = c.green2 }
        -- hl.CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" }
        -- hl.CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" }
        -- hl.CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" }

        hl.CmpItemKindConstant = { fg = c.fg, bg = c.magenta2 }
        hl.CmpItemKindConstructor = { fg = c.fg, bg = c.magenta2 }
        hl.CmpItemKindReference = { fg = c.fg, bg = c.magenta2 }
        -- hl.CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" }
        -- hl.CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" }
        -- hl.CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" }

        hl.CmpItemKindFunction = { fg = c.fg, bg = c.purple }
        hl.CmpItemKindStruct = { fg = c.fg, bg = c.purple }
        hl.CmpItemKindClass = { fg = c.fg, bg = c.purple }
        hl.CmpItemKindModule = { fg = c.fg, bg = c.purple }
        hl.CmpItemKindOperator = { fg = c.fg, bg = c.purple }
        -- hl.CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" }
        -- hl.CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" }
        -- hl.CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" }
        -- hl.CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" }
        -- hl.CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" }

        hl.CmpItemKindVariable = { fg = c.fg_dark, bg = c.dark3 }
        hl.CmpItemKindFile = { fg = c.fg_dark, bg = c.dark3 }
        -- hl.CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" }
        -- hl.CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" }

        hl.CmpItemKindUnit = { fg = c.fg, bg = c.yellow }
        hl.CmpItemKindSnippet = { fg = c.fg, bg = c.yellow }
        hl.CmpItemKindFolder = { fg = c.fg, bg = c.yellow }
        -- hl.CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" }
        -- hl.CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" }
        -- hl.CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" }

        hl.CmpItemKindMethod = { fg = c.fg, bg = c.blue }
        hl.CmpItemKindValue = { fg = c.fg, bg = c.blue }
        hl.CmpItemKindEnumMember = { fg = c.fg, bg = c.blue }
        -- hl.CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" }
        -- hl.CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" }
        -- hl.CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" }

        hl.CmpItemKindInterface = { fg = c.fg, bg = c.blue2 }
        hl.CmpItemKindColor = { fg = c.fg, bg = c.blue2 }
        hl.CmpItemKindTypeParameter = { fg = c.fg, bg = c.blue2 }
        -- hl.CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" }
        -- hl.CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" }
        -- hl.CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" }
    end,
})
local colorscheme = require("tokyonight.colors").setup()
local util = require("tokyonight.util")
local grey9 = util.darken(colorscheme.bg_highlight, 0.5)
local dark_red = util.darken(colorscheme.red, 0.5)
vim.cmd("colorscheme tokyonight-night")

-- require("onenord").setup({
--     custom_colors = {
--         bg = "#1e222a",
--     }
-- })
-- local colorscheme = require("onenord.colors").load()
-- local grey9 = colorscheme.light_gray
-- local dark_red = colorscheme.dark_red

local colors = vim.tbl_deep_extend("force", colorscheme, {
    statusline_bg = colorscheme.bg_statusline,
    statusline_div = colorscheme.bg_statusline,
    statusline_text = colorscheme.fg,
    grey9 = grey9,
    dark_red = dark_red,
    -- bg_dark = "#2e3440",
    -- gray = colorscheme.terminal_black,
})

-- kanagawa
-- require("kanagawa").setup({
--     theme = "dragon",
--     colors = {
--         theme = {
--             all = {
--                 ui = {
--                     bg_gutter = "none"
--                 }
--             }
--         }
--     },
--     overrides = function(colors)
--         local theme = colors.theme
--         return {
--             -- TelescopeTitle = { fg = theme.ui.special, bold = true },
--             -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
--             -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
--             -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
--             -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
--             -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
--             -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
--             Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
--             PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
--             PmenuSbar = { bg = theme.ui.bg_m1 },
--             PmenuThumb = { bg = theme.ui.bg_p2 },
--         }
--     end,
-- });
-- vim.cmd("colorscheme kanagawa-dragon")
-- local colorscheme = require("kanagawa.colors").setup().palette
-- local colors = vim.tbl_deep_extend("force", colorscheme, {
--     statusline_bg = colorscheme.dragonBlack0,
--     statusline_div = colorscheme.dragonGray3,
--     statusline_text = colorscheme.dragonWhite,
--     grey9 = colorscheme.dragonGray2,
--     dark_red = colorscheme.dragonRed,
--     -- bg_dark = "#2e3440",
--     -- gray = colorscheme.terminal_black,
--     bg = colorscheme.dragonBlack3,
--     bg_dark = colorscheme.dragonBlack1,
--     purple = colorscheme.dragonPink,
--     blue = colorscheme.dragonBlue,
--     orange = colorscheme.dragonOrange,
--     teal = colorscheme.dragonTeal,
--     yellow = colorscheme.dragonYellow,
--     cyan = colorscheme.dragonBlue2,
--     green = colorscheme.dragonGreen,
--     red = colorscheme.dragonRed,
-- })

-- everforest
-- require("everforest").setup({
--     background = "hard",
-- })
-- vim.cmd("colorscheme everforest")
-- local colorscheme = require("everforest.colours").generate_palette({ background = "hard" }, "dark")
-- vim.pretty_print(colorscheme)
-- local colors = vim.tbl_deep_extend("force", colorscheme, {
--     bg = colorscheme.bg0,
--     statusline_bg = colorscheme.bg0,
--     statusline_div = colorscheme.bg,
--     statusline_text = colorscheme.fg,
--     grey9 = colorscheme.grey0,
--     dark_red = colorscheme.red1,
--     bg_dark = colorscheme.bg1,
--     -- gray = colorscheme.terminal_black,
-- })

M.colors = colors
return M
