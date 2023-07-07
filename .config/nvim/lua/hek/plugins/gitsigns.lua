return {
    -- Git
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = "BufReadPre",
    config = function()
        local gs = require("gitsigns")
        -- Gitsigns
        gs.setup {
            numhl = false,
            signcolumn = true,
            signs = {
                add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAdd", linehl = "GitSignsAdd" },
                change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChange", linehl = "GitSignsChange" },
                delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDelete", linehl = "GitSignsDelete" },
                topdelete = {
                    hl = "GitSignsDelete",
                    text = "‾",
                    numhl = "GitSignsDelete",
                    linehl = "GitSignsDelete",
                },
                changedelete = {
                    hl = "GitSignsChange",
                    text = "~",
                    numhl = "GitSignsChange",
                    linehl = "GitSignsChange",
                },
            },
            watch_gitdir = {
                interval = 100
            },
            sign_priority = 5,
            status_formatter = nil, -- Use default,
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 2000,
                virt_text = true,
                virt_text_pos = 'eol',
                ignore_whitespace = false,
            },
            current_line_blame_formatter_opts = {
                relative_time = false,
            },
            update_debounce = 100,
        }
    end
}
