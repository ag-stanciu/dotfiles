return {}
-- return {
--     "sontungexpt/sttusline",
--     dependencies = {
--         "nvim-tree/nvim-web-devicons",
--     },
--     event = { "BufEnter" },
--     config = function(_, opts)
--         local util = require("hek.util")
--         local colors = require("hek.color").colors
--         local diagnostics = require("sttusline.components.diagnostics")
--         diagnostics.set_config {
--             icons = {
--                 ERROR = util.signs.Error,
--                 INFO = util.signs.Info,
--                 HINT = util.signs.Hint,
--                 WARN = util.signs.Warn,
--             },
--             order = { "ERROR", "WARN", "INFO", "HINT" },
--         }
--         local git_diff = require("sttusline.components.git-diff")
--
--         git_diff.set_config {
--             icons = {
--                 added = "",
--                 changed = "",
--                 removed = "",
--             },
--             order = { "added", "changed", "removed" },
--         }
--         require("sttusline").setup {
--             statusline_color = colors.bg,
--             -- statusline_color = "StatusLine",
--
--             -- | 1 | 2 | 3
--             -- recommended: 3
--             laststatus = 3,
--             disabled = {
--                 filetypes = {
--                     "NvimTree",
--                     "lazy",
--                 },
--                 buftypes = {
--                     "terminal",
--                 },
--             },
--             components = {
--                 "mode",
--                 -- "filename",
--                 "git-branch",
--                 "git-diff",
--                 "%=",
--                 "diagnostics",
--                 "lsps-formatters",
--                 -- "copilot",
--                 -- "indent",
--                 -- "encoding",
--                 "pos-cursor",
--                 "pos-cursor-progress",
--             },
--         }
--     end,
-- }