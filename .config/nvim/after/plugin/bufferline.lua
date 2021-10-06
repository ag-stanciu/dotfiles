local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end
-- Bufferine
bufferline.setup {
  options = {
    offsets = {{filetype = "NvimTree", text = "", padding = 1}},
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thin",
    -- mappings = true,
    always_show_bufferline = true
  }
}

vim.api.nvim_set_keymap("n", "<S-t>", ":enew<CR>", {noremap = true, silent = true}) -- new buffer
vim.api.nvim_set_keymap("n", "<C-t>b", ":tabnew<CR>", {noremap = true, silent = true}) -- new tab
vim.api.nvim_set_keymap("n", "<S-x>", ":bd!<CR>", {noremap = true, silent = true}) -- close tab
vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})

