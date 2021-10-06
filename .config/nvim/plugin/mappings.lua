--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

--Add move line shortcuts
vim.api.nvim_set_keymap('n', '<a-j>', ':m .+1<cr>==', { noremap = true})
vim.api.nvim_set_keymap('n', '<a-k>', ':m .-2<cr>==', { noremap = true})
vim.api.nvim_set_keymap('i', '<a-j>', '<esc>:m .+1<cr>==gi', { noremap = true})
vim.api.nvim_set_keymap('i', '<a-k>', '<esc>:m .-2<cr>==gi', { noremap = true})
vim.api.nvim_set_keymap('v', '<a-j>', ':m \'>+1<cr>gv=gv', { noremap = true})
vim.api.nvim_set_keymap('v', '<a-k>', ':m \'<-2<cr>gv=gv', { noremap = true})

-- copy whole file content
-- vim.api.nvim_set_keymap("n", "<c-a>", ":%y+<cr>", { noremap = true})

-- center search
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true})
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true})
-- vim.api.nvim_set_keymap('n', 'j', 'mzj`z', { noremap = true})
