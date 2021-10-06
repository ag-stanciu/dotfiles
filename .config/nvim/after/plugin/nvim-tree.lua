local ok, tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

-- NvimTree
vim.g.nvim_tree_ignore = { '.git', '__pycache__', 'node_modules', '.idea', '.DS_Store' }
tree.setup {
  view = {
    width = '25%',
  }
}
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

