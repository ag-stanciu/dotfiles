local ok, gs = pcall(require, 'gitsigns')
if not ok then
    return
end
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
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = { expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\'' },
        ["n [c"] = { expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\'' },
        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
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
