local ok, gs = pcall(require, 'gitsigns')
if not ok then
  return
end
-- Gitsigns
gs.setup {
  signs = {
    add = {hl = "GitGutterAdd", text = "│"},
    change = {hl = "GitGutterChange", text = "│"},
    delete = {hl = "GitGutterDelete", text = "_"},
    topdelete = {hl = "GitGutterDelete", text = "‾"},
    changedelete = {hl = "GitGutterChange", text = "~"}
  },
  numhl = false,
  keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,
      ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
      ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
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
    virt_text_pos = 'eol'
  }
}
