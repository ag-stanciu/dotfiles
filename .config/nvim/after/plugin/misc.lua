local u = require('utils')
local M = {}

-- neoscroll
M.neoscroll = function()
  local ns = u.check_plugin('neoscroll')
  if ns then
    ns.setup()
  end
end

-- Autopairs
M.autopairs = function()
  local nap = u.check_plugin('nvim-autopairs')
  if nap then nap.setup() end

  local nap_cmp = u.check_plugin('nvim-autopairs.completion.cmp')
  if nap_cmp then
    nap_cmp.setup {
      map_cr = true,
      map_cr_complete = true
    }
  end
end

-- Comment
M.comment = function()
  local comment = u.check_plugin('nvim_comment')
  if comment then
    comment.setup()
    vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
  end
end

M.neoscroll()
M.autopairs()
M.comment()
