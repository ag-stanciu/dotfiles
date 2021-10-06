local ok, blankline = pcall(require, 'indent_blankline')
if not ok then
  return
end

blankline.setup {
  char = '┊',
  filetype_exclude = {'help, packer'},
  buftype_exclude = { 'terminal', 'nofile'},
  char_highlight = 'LineNr',
  show_trailing_blankline_indent = false,
  -- show_end_of_line = true,
  space_char_blankline = ' ',
  -- show_current_context = true,
  -- show_first_indent_level = false,
}
