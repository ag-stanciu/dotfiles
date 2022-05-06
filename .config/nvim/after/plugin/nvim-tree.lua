local ok, tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

-- NvimTree
-- vim.g.nvim_tree_ignore = { ".git", "__pycache__", "node_modules", ".idea", ".DS_Store" }
tree.setup {
  view = {
    width = 25,
  },
  filters = {
    custom = { ".git", "__pycache__", "node_modules", ".idea", ".DS_Store" }
  }
}
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })

